module Deku.DOM.Elt.AnimateMotion where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data AnimateMotion_

animateMotion
  :: Event (Attribute AnimateMotion_)
  -> Array Domable
  -> Domable
animateMotion attributes kids = Domable
  ( Element'
      ( DC.elementify "animateMotion" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

animateMotion_
  :: Array Domable
  -> Domable
animateMotion_ = animateMotion empty

animateMotion__
  :: String
  -> Domable
animateMotion__ t = animateMotion_ [ DC.text_ t ]
