module Deku.DOM.Attr.Rel where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Rel = Rel

instance Attr Tags.A_ Rel String where
  pureAttr Rel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "rel", value }

  mapAttr Rel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "rel", value: prop' value }

instance Attr Tags.Area_ Rel String where
  pureAttr Rel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "rel", value }

  mapAttr Rel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "rel", value: prop' value }

instance Attr Tags.Link_ Rel String where
  pureAttr Rel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "rel", value }

  mapAttr Rel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "rel", value: prop' value }

instance Attr everything Rel Unit where
  pureAttr Rel _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "rel", value: unset' }
  mapAttr Rel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "rel", value: unset' }
