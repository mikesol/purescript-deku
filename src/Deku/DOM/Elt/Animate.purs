module Deku.DOM.Elt.Animate where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Animate_

animate
  :: forall payload
   . Event (Attribute Animate_)
  -> Array (Domable payload)
  -> Domable payload
animate attributes kids = Domable
  ( Element'
      ( DC.elementify "animate" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

animate_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
animate_ = animate empty

animate__
  :: forall payload
   . String
  -> Domable payload
animate__ t = animate_ [ DC.text_ t ]
