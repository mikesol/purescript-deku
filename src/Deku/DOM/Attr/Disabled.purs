module Deku.DOM.Attr.Disabled where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Disabled = Disabled

instance Attr Tags.Button_ Disabled String where
  pureAttr Disabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "disabled", value }

  mapAttr Disabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "disabled", value: prop' value }

instance Attr Tags.Fieldset_ Disabled String where
  pureAttr Disabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "disabled", value }

  mapAttr Disabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "disabled", value: prop' value }

instance Attr Tags.Input_ Disabled String where
  pureAttr Disabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "disabled", value }

  mapAttr Disabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "disabled", value: prop' value }

instance Attr Tags.Optgroup_ Disabled String where
  pureAttr Disabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "disabled", value }

  mapAttr Disabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "disabled", value: prop' value }

instance Attr Tags.Option_ Disabled String where
  pureAttr Disabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "disabled", value }

  mapAttr Disabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "disabled", value: prop' value }

instance Attr Tags.Select_ Disabled String where
  pureAttr Disabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "disabled", value }

  mapAttr Disabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "disabled", value: prop' value }

instance Attr Tags.Textarea_ Disabled String where
  pureAttr Disabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "disabled", value }

  mapAttr Disabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "disabled", value: prop' value }

instance Attr everything Disabled Unit where
  pureAttr Disabled _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "disabled", value: unset' }
  mapAttr Disabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "disabled", value: unset' }
