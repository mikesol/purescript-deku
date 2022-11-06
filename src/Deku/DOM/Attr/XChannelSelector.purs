module Deku.DOM.Attr.XChannelSelector where

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data XChannelSelector = XChannelSelector

instance Attr FeDisplacementMap_ XChannelSelector String where
  attr XChannelSelector value = unsafeAttribute
    { key: "xChannelSelector", value: prop' value }