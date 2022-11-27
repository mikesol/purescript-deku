module Deku.DOM.Elt.FeTile where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeTile_

feTile
  :: forall lock payload
   . Event (Attribute FeTile_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feTile attributes kids = Domable
  ( Element'
      ( DC.elementify "feTile" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feTile_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feTile_ = feTile empty

feTile__
  :: forall lock payload
   . String
  -> Domable lock payload
feTile__ t = feTile_ [ DC.text_ t ]
