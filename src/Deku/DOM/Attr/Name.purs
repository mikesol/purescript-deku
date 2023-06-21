module Deku.DOM.Attr.Name where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Name = Name

instance Attr Tags.Button_ Name String where
  pureAttr Name value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "name", value }

  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "name", value: prop' value }

instance Attr Tags.Form_ Name String where
  pureAttr Name value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "name", value }

  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "name", value: prop' value }

instance Attr Tags.Fieldset_ Name String where
  pureAttr Name value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "name", value }

  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "name", value: prop' value }

instance Attr Tags.Iframe_ Name String where
  pureAttr Name value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "name", value }

  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "name", value: prop' value }

instance Attr Tags.Input_ Name String where
  pureAttr Name value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "name", value }

  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "name", value: prop' value }

instance Attr Tags.Object_ Name String where
  pureAttr Name value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "name", value }

  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "name", value: prop' value }

instance Attr Tags.Output_ Name String where
  pureAttr Name value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "name", value }

  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "name", value: prop' value }

instance Attr Tags.Select_ Name String where
  pureAttr Name value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "name", value }

  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "name", value: prop' value }

instance Attr Tags.Textarea_ Name String where
  pureAttr Name value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "name", value }

  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "name", value: prop' value }

instance Attr Tags.Map_ Name String where
  pureAttr Name value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "name", value }

  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "name", value: prop' value }

instance Attr Tags.Meta_ Name String where
  pureAttr Name value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "name", value }

  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "name", value: prop' value }

instance Attr Tags.Param_ Name String where
  pureAttr Name value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "name", value }

  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "name", value: prop' value }

instance Attr everything Name Unit where
  pureAttr Name _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "name", value: unset' }
  mapAttr Name evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "name", value: unset' }
