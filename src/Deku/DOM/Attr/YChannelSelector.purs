module Deku.DOM.Attr.YChannelSelector where

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data YChannelSelector = YChannelSelector

instance Attr FeDisplacementMap_ YChannelSelector String where
  attr YChannelSelector value = unsafeAttribute
    { key: "yChannelSelector", value: prop' value }