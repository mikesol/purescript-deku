module Deku.DOM.Elt.FeGaussianBlur where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeGaussianBlur_

feGaussianBlur
  :: Event (Attribute FeGaussianBlur_)
  -> Array Domable
  -> Domable
feGaussianBlur = DC.elementify2 "feGaussianBlur"

feGaussianBlur_
  :: Array Domable
  -> Domable
feGaussianBlur_ = feGaussianBlur empty

feGaussianBlur__
  :: String
  -> Domable
feGaussianBlur__ t = feGaussianBlur_ [ DC.text_ t ]
