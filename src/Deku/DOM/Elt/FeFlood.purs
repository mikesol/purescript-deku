module Deku.DOM.Elt.FeFlood where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeFlood_

feFlood
  :: forall payload
   . Event (Attribute FeFlood_)
  -> Array (Domable payload)
  -> Domable payload
feFlood attributes kids = Domable
  ( Element'
      ( DC.elementify "feFlood" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feFlood_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feFlood_ = feFlood empty

feFlood__
  :: forall payload
   . String
  -> Domable payload
feFlood__ t = feFlood_ [ DC.text_ t ]
