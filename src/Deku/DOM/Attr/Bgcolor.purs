module Deku.DOM.Attr.Bgcolor where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Bgcolor = Bgcolor

instance Attr Tags.Body_ Bgcolor String where
  pureAttr Bgcolor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "bgcolor", value }

  mapAttr Bgcolor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "bgcolor", value: prop' value }

instance Attr Tags.Col_ Bgcolor String where
  pureAttr Bgcolor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "bgcolor", value }

  mapAttr Bgcolor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "bgcolor", value: prop' value }

instance Attr Tags.Colgroup_ Bgcolor String where
  pureAttr Bgcolor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "bgcolor", value }

  mapAttr Bgcolor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "bgcolor", value: prop' value }

instance Attr Tags.Table_ Bgcolor String where
  pureAttr Bgcolor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "bgcolor", value }

  mapAttr Bgcolor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "bgcolor", value: prop' value }

instance Attr Tags.Tbody_ Bgcolor String where
  pureAttr Bgcolor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "bgcolor", value }

  mapAttr Bgcolor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "bgcolor", value: prop' value }

instance Attr Tags.Tfoot_ Bgcolor String where
  pureAttr Bgcolor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "bgcolor", value }

  mapAttr Bgcolor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "bgcolor", value: prop' value }

instance Attr Tags.Td_ Bgcolor String where
  pureAttr Bgcolor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "bgcolor", value }

  mapAttr Bgcolor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "bgcolor", value: prop' value }

instance Attr Tags.Th_ Bgcolor String where
  pureAttr Bgcolor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "bgcolor", value }

  mapAttr Bgcolor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "bgcolor", value: prop' value }

instance Attr Tags.Tr_ Bgcolor String where
  pureAttr Bgcolor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "bgcolor", value }

  mapAttr Bgcolor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "bgcolor", value: prop' value }

instance Attr everything Bgcolor Unit where
  pureAttr Bgcolor _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "bgcolor", value: unset' }
  mapAttr Bgcolor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "bgcolor", value: unset' }
