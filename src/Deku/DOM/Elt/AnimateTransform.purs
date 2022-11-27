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
  :: forall lock payload
   . Event (Attribute AnimateTransform_)
  -> Array (Domable lock payload)
  -> Domable lock payload
animateTransform attributes kids = Domable
  ( Element'
      ( DC.elementify "animateTransform" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

animateTransform_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
animateTransform_ = animateTransform empty

animateTransform__
  :: forall lock payload
   . String
  -> Domable lock payload
animateTransform__ t = animateTransform_ [ DC.text_ t ]
