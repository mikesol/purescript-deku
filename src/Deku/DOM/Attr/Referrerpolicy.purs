module Deku.DOM.Attr.Referrerpolicy where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Referrerpolicy = Referrerpolicy

instance Attr Tags.A_ Referrerpolicy String where
  pureAttr Referrerpolicy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "referrerpolicy", value }
  mapAttr Referrerpolicy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "referrerpolicy", value: prop' value }

instance Attr Tags.Area_ Referrerpolicy String where
  pureAttr Referrerpolicy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "referrerpolicy", value }
  mapAttr Referrerpolicy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "referrerpolicy", value: prop' value }

instance Attr Tags.Iframe_ Referrerpolicy String where
  pureAttr Referrerpolicy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "referrerpolicy", value }
  mapAttr Referrerpolicy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "referrerpolicy", value: prop' value }

instance Attr Tags.Img_ Referrerpolicy String where
  pureAttr Referrerpolicy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "referrerpolicy", value }
  mapAttr Referrerpolicy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "referrerpolicy", value: prop' value }

instance Attr Tags.Link_ Referrerpolicy String where
  pureAttr Referrerpolicy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "referrerpolicy", value }
  mapAttr Referrerpolicy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "referrerpolicy", value: prop' value }

instance Attr Tags.Script_ Referrerpolicy String where
  pureAttr Referrerpolicy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "referrerpolicy", value }
  mapAttr Referrerpolicy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "referrerpolicy", value: prop' value }

instance Attr everything Referrerpolicy Unit where
  pureAttr Referrerpolicy _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "referrerpolicy", value: unset' }
  mapAttr Referrerpolicy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "referrerpolicy", value: unset' }
