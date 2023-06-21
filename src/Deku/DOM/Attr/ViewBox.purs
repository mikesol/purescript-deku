module Deku.DOM.Attr.ViewBox where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ViewBox = ViewBox

instance Attr Tags.Marker_ ViewBox String where
  pureAttr ViewBox value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "viewBox", value }

  mapAttr ViewBox evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "viewBox", value: prop' value }

instance Attr Tags.Pattern_ ViewBox String where
  pureAttr ViewBox value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "viewBox", value }

  mapAttr ViewBox evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "viewBox", value: prop' value }

instance Attr Tags.Svg_ ViewBox String where
  pureAttr ViewBox value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "viewBox", value }

  mapAttr ViewBox evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "viewBox", value: prop' value }

instance Attr Tags.Symbol_ ViewBox String where
  pureAttr ViewBox value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "viewBox", value }

  mapAttr ViewBox evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "viewBox", value: prop' value }

instance Attr Tags.View_ ViewBox String where
  pureAttr ViewBox value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "viewBox", value }

  mapAttr ViewBox evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "viewBox", value: prop' value }

instance Attr everything ViewBox Unit where
  pureAttr ViewBox _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "viewBox", value: unset' }
  mapAttr ViewBox evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "viewBox", value: unset' }
