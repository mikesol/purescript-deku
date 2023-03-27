module Deku.DOM.Elt.AnimateTransform where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data AnimateTransform_

animateTransform
  :: Event (Attribute AnimateTransform_)
  -> Array Domable
  -> Domable
animateTransform attributes kids = Domable
  ( Element'
      ( DC.elementify "animateTransform" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

animateTransform_
  :: Array Domable
  -> Domable
animateTransform_ = animateTransform empty

animateTransform__
  :: String
  -> Domable
animateTransform__ t = animateTransform_ [ DC.text_ t ]
