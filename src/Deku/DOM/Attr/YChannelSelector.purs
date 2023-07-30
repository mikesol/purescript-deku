module Deku.DOM.Attr.YChannelSelector where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data YChannelSelector = YChannelSelector

instance Attr FeDisplacementMap_ YChannelSelector String where
  attr YChannelSelector bothValues = unsafeAttribute $ Both
    { key: "yChannelSelector", value: prop' (fst bothValues) }
    ( snd bothValues <#> \value ->
        { key: "yChannelSelector", value: prop' value }
    )
  pureAttr YChannelSelector value = unsafeAttribute $ This
    { key: "yChannelSelector", value: prop' value }
  unpureAttr YChannelSelector eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "yChannelSelector", value: prop' value }

instance Attr everything YChannelSelector Unit where
  attr YChannelSelector bothValues = unsafeAttribute $ Both
    { key: "yChannelSelector", value: unset' }
    (snd bothValues <#> \_ -> { key: "yChannelSelector", value: unset' })
  pureAttr YChannelSelector _ = unsafeAttribute $ This
    { key: "yChannelSelector", value: unset' }
  unpureAttr YChannelSelector eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "yChannelSelector", value: unset' }
