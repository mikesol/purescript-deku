module Deku.DOM.Attr.Exponent where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Exponent = Exponent

instance Attr Tags.FeFuncA_ Exponent String where
  pureAttr Exponent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "exponent", value }

  mapAttr Exponent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "exponent", value: prop' value }

instance Attr Tags.FeFuncB_ Exponent String where
  pureAttr Exponent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "exponent", value }

  mapAttr Exponent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "exponent", value: prop' value }

instance Attr Tags.FeFuncG_ Exponent String where
  pureAttr Exponent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "exponent", value }

  mapAttr Exponent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "exponent", value: prop' value }

instance Attr Tags.FeFuncR_ Exponent String where
  pureAttr Exponent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "exponent", value }

  mapAttr Exponent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "exponent", value: prop' value }

instance Attr everything Exponent Unit where
  pureAttr Exponent _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "exponent", value: unset' }
  mapAttr Exponent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "exponent", value: unset' }
