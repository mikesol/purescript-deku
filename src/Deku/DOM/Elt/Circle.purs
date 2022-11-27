module Deku.DOM.Elt.Circle where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Circle_

circle
  :: forall lock payload
   . Event (Attribute Circle_)
  -> Array (Domable lock payload)
  -> Domable lock payload
circle attributes kids = Domable
  ( Element'
      ( DC.elementify "circle" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

circle_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
circle_ = circle empty

circle__
  :: forall lock payload
   . String
  -> Domable lock payload
circle__ t = circle_ [ DC.text_ t ]
