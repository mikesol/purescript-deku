module Deku.DOM.Attr.XChannelSelector where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XChannelSelector = XChannelSelector

instance Attr FeDisplacementMap_ XChannelSelector String where
  attr XChannelSelector bothValues = unsafeAttribute $ Both
    { key: "xChannelSelector", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "xChannelSelector", value: prop' value }
    )
  pureAttr XChannelSelector value = unsafeAttribute $ This
    { key: "xChannelSelector", value: prop' value }
  unpureAttr XChannelSelector eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "xChannelSelector", value: prop' value }

instance Attr everything XChannelSelector Unit where
  attr XChannelSelector bothValues = unsafeAttribute $ Both
    { key: "xChannelSelector", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "xChannelSelector", value: unset' })
  pureAttr XChannelSelector _ = unsafeAttribute $ This
    { key: "xChannelSelector", value: unset' }
  unpureAttr XChannelSelector eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "xChannelSelector", value: unset' }
