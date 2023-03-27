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
  :: Event (Attribute FeFlood_)
  -> Array Domable
  -> Domable
feFlood attributes kids = Domable
  ( Element'
      ( DC.elementify "feFlood" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feFlood_
  :: Array Domable
  -> Domable
feFlood_ = feFlood empty

feFlood__
  :: String
  -> Domable
feFlood__ t = feFlood_ [ DC.text_ t ]
