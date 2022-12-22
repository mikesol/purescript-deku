module Deku.DOM.Attr.EdgeMode where

import Prelude

import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data EdgeMode = EdgeMode

instance Attr FeConvolveMatrix_ EdgeMode String where
  attr EdgeMode value = unsafeAttribute { key: "edgeMode", value: prop' value }

instance Attr FeGaussianBlur_ EdgeMode String where
  attr EdgeMode value = unsafeAttribute { key: "edgeMode", value: prop' value }

instance Attr everything EdgeMode Unit where
  attr EdgeMode _ = unsafeAttribute
    { key: "edgeMode", value: unset' }
