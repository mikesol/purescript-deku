module Deku.DOM.Attr.Readonly where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Readonly = Readonly

instance Attr Tags.Input_ Readonly String where
  pureAttr Readonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "readonly", value }

  mapAttr Readonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "readonly", value: prop' value }

instance Attr Tags.Textarea_ Readonly String where
  pureAttr Readonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "readonly", value }

  mapAttr Readonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "readonly", value: prop' value }

instance Attr everything Readonly Unit where
  pureAttr Readonly _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "readonly", value: unset' }
  mapAttr Readonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "readonly", value: unset' }
