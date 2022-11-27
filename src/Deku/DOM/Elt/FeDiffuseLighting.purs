module Deku.DOM.Elt.FeDiffuseLighting where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeDiffuseLighting_

feDiffuseLighting
  :: forall lock payload
   . Event (Attribute FeDiffuseLighting_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feDiffuseLighting attributes kids = Domable
  ( Element'
      ( DC.elementify "feDiffuseLighting" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feDiffuseLighting_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feDiffuseLighting_ = feDiffuseLighting empty

feDiffuseLighting__
  :: forall lock payload
   . String
  -> Domable lock payload
feDiffuseLighting__ t = feDiffuseLighting_ [ DC.text_ t ]
