module Deku.DOM.Attr.XChannelSelector where

import Prelude

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XChannelSelector = XChannelSelector

instance Attr FeDisplacementMap_ XChannelSelector String where
  attr XChannelSelector value = unsafeAttribute
    { key: "xChannelSelector", value: prop' value }

instance Attr everything XChannelSelector Unit where
  attr XChannelSelector _ = unsafeAttribute
    { key: "xChannelSelector", value: unset' }
