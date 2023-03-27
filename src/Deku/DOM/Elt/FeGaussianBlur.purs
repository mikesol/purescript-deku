module Deku.DOM.Elt.FeGaussianBlur where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeGaussianBlur_

feGaussianBlur
  :: forall payload
   . Event (Attribute FeGaussianBlur_)
  -> Array (Domable payload)
  -> Domable payload
feGaussianBlur attributes kids = Domable
  ( Element'
      ( DC.elementify "feGaussianBlur" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feGaussianBlur_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feGaussianBlur_ = feGaussianBlur empty

feGaussianBlur__
  :: forall payload
   . String
  -> Domable payload
feGaussianBlur__ t = feGaussianBlur_ [ DC.text_ t ]
