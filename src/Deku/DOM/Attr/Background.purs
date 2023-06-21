module Deku.DOM.Attr.Background where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Background = Background

instance Attr Tags.Body_ Background String where
  pureAttr Background value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "background", value }
  mapAttr Background evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "background", value: prop' value }

instance Attr Tags.Table_ Background String where
  pureAttr Background value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "background", value }
  mapAttr Background evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "background", value: prop' value }

instance Attr Tags.Td_ Background String where
  pureAttr Background value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "background", value }
  mapAttr Background evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "background", value: prop' value }

instance Attr Tags.Th_ Background String where
  pureAttr Background value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "background", value }
  mapAttr Background evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "background", value: prop' value }

instance Attr everything Background Unit where
  pureAttr Background _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "background", value: unset' }
  mapAttr Background evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "background", value: unset' }
