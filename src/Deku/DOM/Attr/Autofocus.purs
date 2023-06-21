module Deku.DOM.Attr.Autofocus where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Autofocus = Autofocus

instance Attr Tags.Button_ Autofocus String where
  pureAttr Autofocus value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autofocus", value }
  mapAttr Autofocus evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autofocus", value: prop' value }

instance Attr Tags.Input_ Autofocus String where
  pureAttr Autofocus value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autofocus", value }
  mapAttr Autofocus evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autofocus", value: prop' value }

instance Attr Tags.Select_ Autofocus String where
  pureAttr Autofocus value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autofocus", value }
  mapAttr Autofocus evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autofocus", value: prop' value }

instance Attr Tags.Textarea_ Autofocus String where
  pureAttr Autofocus value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autofocus", value }
  mapAttr Autofocus evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autofocus", value: prop' value }

instance Attr everything Autofocus Unit where
  pureAttr Autofocus _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "autofocus", value: unset' }
  mapAttr Autofocus evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autofocus", value: unset' }
