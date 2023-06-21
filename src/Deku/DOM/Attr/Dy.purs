module Deku.DOM.Attr.Dy where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Dy = Dy

instance Attr Tags.FeDropShadow_ Dy String where
  pureAttr Dy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dy", value }

  mapAttr Dy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dy", value: prop' value }

instance Attr Tags.FeOffset_ Dy String where
  pureAttr Dy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dy", value }

  mapAttr Dy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dy", value: prop' value }

instance Attr Tags.Text_ Dy String where
  pureAttr Dy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dy", value }

  mapAttr Dy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dy", value: prop' value }

instance Attr Tags.Tspan_ Dy String where
  pureAttr Dy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dy", value }

  mapAttr Dy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dy", value: prop' value }

instance Attr everything Dy Unit where
  pureAttr Dy _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "dy", value: unset' }
  mapAttr Dy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dy", value: unset' }
