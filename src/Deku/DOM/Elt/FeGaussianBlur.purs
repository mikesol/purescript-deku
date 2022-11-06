module Deku.DOM.Elt.FeGaussianBlur where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeGaussianBlur_

feGaussianBlur
  :: forall lock payload
   . Event (Attribute FeGaussianBlur_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feGaussianBlur attributes kids = Domable
  ( Element'
      ( elementify "feGaussianBlur" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feGaussianBlur_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feGaussianBlur_ = feGaussianBlur empty