module Deku.DOM.Attr.Align where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Align = Align

instance Attr Tags.Applet_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Caption_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Col_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Colgroup_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Hr_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Iframe_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Img_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Table_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Tbody_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Td_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Tfoot_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Th_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Thead_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr Tags.Tr_ Align String where
  pureAttr Align value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "align", value }

  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "align", value: prop' value }

instance Attr everything Align Unit where
  pureAttr Align _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "align", value: unset' }
  mapAttr Align evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "align", value: unset' }
