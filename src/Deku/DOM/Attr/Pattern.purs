module Deku.DOM.Attr.Pattern where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Pattern = Pattern

instance Attr Tags.Input_ Pattern String where
  pureAttr Pattern value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pattern", value }

  mapAttr Pattern evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "pattern", value: prop' value }

instance Attr everything Pattern Unit where
  pureAttr Pattern _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "pattern", value: unset' }
  mapAttr Pattern evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pattern", value: unset' }
