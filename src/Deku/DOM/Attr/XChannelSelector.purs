module Deku.DOM.Attr.XChannelSelector where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data XChannelSelector = XChannelSelector

instance Attr Tags.FeDisplacementMap_ XChannelSelector String where
  pureAttr XChannelSelector value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xChannelSelector", value }
  mapAttr XChannelSelector evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "xChannelSelector", value: prop' value }

instance Attr everything XChannelSelector Unit where
  pureAttr XChannelSelector _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "xChannelSelector", value: unset' }
  mapAttr XChannelSelector evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "xChannelSelector", value: unset' }
