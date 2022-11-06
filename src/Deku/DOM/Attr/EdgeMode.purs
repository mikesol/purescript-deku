module Deku.DOM.Attr.EdgeMode where

import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data EdgeMode = EdgeMode

instance Attr FeConvolveMatrix_ EdgeMode String where
  attr EdgeMode value = unsafeAttribute { key: "edgeMode", value: prop' value }
instance Attr FeGaussianBlur_ EdgeMode String where
  attr EdgeMode value = unsafeAttribute { key: "edgeMode", value: prop' value }