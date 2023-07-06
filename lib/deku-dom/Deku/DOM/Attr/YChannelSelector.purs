module Deku.DOM.Attr.YChannelSelector where

import Prelude

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data YChannelSelector = YChannelSelector

instance Attr FeDisplacementMap_ YChannelSelector String where
  attr YChannelSelector value = unsafeAttribute
    { key: "yChannelSelector", value: prop' value }

instance Attr everything YChannelSelector Unit where
  attr YChannelSelector _ = unsafeAttribute
    { key: "yChannelSelector", value: unset' }
