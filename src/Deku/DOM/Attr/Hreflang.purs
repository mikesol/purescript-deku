module Deku.DOM.Attr.Hreflang where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Hreflang = Hreflang

instance Attr Tags.A_ Hreflang String where
  pureAttr Hreflang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hreflang", value }

  mapAttr Hreflang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hreflang", value: prop' value }

instance Attr Tags.Area_ Hreflang String where
  pureAttr Hreflang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hreflang", value }

  mapAttr Hreflang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hreflang", value: prop' value }

instance Attr Tags.Link_ Hreflang String where
  pureAttr Hreflang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hreflang", value }

  mapAttr Hreflang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hreflang", value: prop' value }

instance Attr everything Hreflang Unit where
  pureAttr Hreflang _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "hreflang", value: unset' }
  mapAttr Hreflang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "hreflang", value: unset' }
