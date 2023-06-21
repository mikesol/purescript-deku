module Deku.DOM.Attr.Href where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Href = Href

instance Attr Tags.A_ Href String where
  pureAttr Href value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "href", value }

  mapAttr Href evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "href", value: prop' value }

instance Attr Tags.Area_ Href String where
  pureAttr Href value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "href", value }

  mapAttr Href evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "href", value: prop' value }

instance Attr Tags.Base_ Href String where
  pureAttr Href value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "href", value }

  mapAttr Href evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "href", value: prop' value }

instance Attr Tags.Link_ Href String where
  pureAttr Href value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "href", value }

  mapAttr Href evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "href", value: prop' value }

instance Attr Tags.Image_ Href String where
  pureAttr Href value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "href", value }

  mapAttr Href evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "href", value: prop' value }

instance Attr Tags.LinearGradient_ Href String where
  pureAttr Href value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "href", value }

  mapAttr Href evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "href", value: prop' value }

instance Attr Tags.Pattern_ Href String where
  pureAttr Href value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "href", value }

  mapAttr Href evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "href", value: prop' value }

instance Attr Tags.RadialGradient_ Href String where
  pureAttr Href value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "href", value }

  mapAttr Href evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "href", value: prop' value }

instance Attr Tags.TextPath_ Href String where
  pureAttr Href value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "href", value }

  mapAttr Href evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "href", value: prop' value }

instance Attr Tags.Use_ Href String where
  pureAttr Href value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "href", value }

  mapAttr Href evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "href", value: prop' value }

instance Attr everything Href Unit where
  pureAttr Href _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "href", value: unset' }
  mapAttr Href evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "href", value: unset' }
