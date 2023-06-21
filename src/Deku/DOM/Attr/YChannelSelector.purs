module Deku.DOM.Attr.YChannelSelector where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data YChannelSelector = YChannelSelector

instance Attr Tags.FeDisplacementMap_ YChannelSelector String where
  pureAttr YChannelSelector value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "yChannelSelector", value }
  mapAttr YChannelSelector evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "yChannelSelector", value: prop' value }

instance Attr everything YChannelSelector Unit where
  pureAttr YChannelSelector _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "yChannelSelector", value: unset' }
  mapAttr YChannelSelector evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "yChannelSelector", value: unset' }
