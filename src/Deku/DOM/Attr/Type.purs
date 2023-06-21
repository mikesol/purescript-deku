module Deku.DOM.Attr.Type where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Type = Type

instance Attr Tags.AnimateTransform_ Type String where
  pureAttr Type value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Type evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.FeColorMatrix_ Type String where
  pureAttr Type value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Type evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.FeFuncA_ Type String where
  pureAttr Type value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Type evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.FeFuncB_ Type String where
  pureAttr Type value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Type evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.FeFuncG_ Type String where
  pureAttr Type value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Type evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.FeFuncR_ Type String where
  pureAttr Type value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Type evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.FeTurbulence_ Type String where
  pureAttr Type value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Type evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr everything Type Unit where
  pureAttr Type _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "type", value: unset' }
  mapAttr Type evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "type", value: unset' }
