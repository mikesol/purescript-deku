module Deku.DOM.Attr.Colspan where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Colspan = Colspan

instance Attr Tags.Td_ Colspan String where
  pureAttr Colspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "colspan", value }

  mapAttr Colspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "colspan", value: prop' value }

instance Attr Tags.Th_ Colspan String where
  pureAttr Colspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "colspan", value }

  mapAttr Colspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "colspan", value: prop' value }

instance Attr everything Colspan Unit where
  pureAttr Colspan _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "colspan", value: unset' }
  mapAttr Colspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "colspan", value: unset' }
