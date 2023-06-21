module Deku.DOM.Attr.Span where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Span = Span

instance Attr Tags.Col_ Span String where
  pureAttr Span value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "span", value }

  mapAttr Span evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "span", value: prop' value }

instance Attr Tags.Colgroup_ Span String where
  pureAttr Span value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "span", value }

  mapAttr Span evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "span", value: prop' value }

instance Attr everything Span Unit where
  pureAttr Span _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "span", value: unset' }
  mapAttr Span evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "span", value: unset' }
