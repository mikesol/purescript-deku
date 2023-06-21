module Deku.DOM.Attr.Multiple where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Multiple = Multiple

instance Attr Tags.Input_ Multiple String where
  pureAttr Multiple value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "multiple", value }

  mapAttr Multiple evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "multiple", value: prop' value }

instance Attr Tags.Select_ Multiple String where
  pureAttr Multiple value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "multiple", value }

  mapAttr Multiple evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "multiple", value: prop' value }

instance Attr everything Multiple Unit where
  pureAttr Multiple _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "multiple", value: unset' }
  mapAttr Multiple evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "multiple", value: unset' }
