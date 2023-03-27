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
  :: Event (Attribute Circle_)
  -> Array Domable
  -> Domable
circle attributes kids = Domable
  ( Element'
      ( DC.elementify "circle" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

circle_
  :: Array Domable
  -> Domable
circle_ = circle empty

circle__
  :: String
  -> Domable
circle__ t = circle_ [ DC.text_ t ]
