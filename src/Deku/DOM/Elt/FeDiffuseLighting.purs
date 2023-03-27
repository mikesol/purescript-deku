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
  :: forall payload
   . Event (Attribute FeDiffuseLighting_)
  -> Array (Domable payload)
  -> Domable payload
feDiffuseLighting attributes kids = Domable
  ( Element'
      ( DC.elementify "feDiffuseLighting" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feDiffuseLighting_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feDiffuseLighting_ = feDiffuseLighting empty

feDiffuseLighting__
  :: forall payload
   . String
  -> Domable payload
feDiffuseLighting__ t = feDiffuseLighting_ [ DC.text_ t ]
