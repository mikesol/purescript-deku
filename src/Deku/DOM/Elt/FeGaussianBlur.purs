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
  :: Event (Attribute FeGaussianBlur_)
  -> Array Domable
  -> Domable
feGaussianBlur attributes kids = Domable
  ( Element'
      ( DC.elementify "feGaussianBlur" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feGaussianBlur_
  :: Array Domable
  -> Domable
feGaussianBlur_ = feGaussianBlur empty

feGaussianBlur__
  :: String
  -> Domable
feGaussianBlur__ t = feGaussianBlur_ [ DC.text_ t ]
