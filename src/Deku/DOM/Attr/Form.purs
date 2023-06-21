module Deku.DOM.Attr.Form where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Form = Form

instance Attr Tags.Button_ Form String where
  pureAttr Form value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "form", value }

  mapAttr Form evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "form", value: prop' value }

instance Attr Tags.Fieldset_ Form String where
  pureAttr Form value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "form", value }

  mapAttr Form evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "form", value: prop' value }

instance Attr Tags.Input_ Form String where
  pureAttr Form value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "form", value }

  mapAttr Form evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "form", value: prop' value }

instance Attr Tags.Label_ Form String where
  pureAttr Form value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "form", value }

  mapAttr Form evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "form", value: prop' value }

instance Attr Tags.Meter_ Form String where
  pureAttr Form value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "form", value }

  mapAttr Form evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "form", value: prop' value }

instance Attr Tags.Object_ Form String where
  pureAttr Form value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "form", value }

  mapAttr Form evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "form", value: prop' value }

instance Attr Tags.Output_ Form String where
  pureAttr Form value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "form", value }

  mapAttr Form evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "form", value: prop' value }

instance Attr Tags.Progress_ Form String where
  pureAttr Form value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "form", value }

  mapAttr Form evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "form", value: prop' value }

instance Attr Tags.Select_ Form String where
  pureAttr Form value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "form", value }

  mapAttr Form evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "form", value: prop' value }

instance Attr Tags.Textarea_ Form String where
  pureAttr Form value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "form", value }

  mapAttr Form evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "form", value: prop' value }

instance Attr everything Form Unit where
  pureAttr Form _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "form", value: unset' }
  mapAttr Form evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "form", value: unset' }
