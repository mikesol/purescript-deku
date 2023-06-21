module Deku.DOM.Attr.Method where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Method = Method

instance Attr Tags.Form_ Method String where
  pureAttr Method value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "method", value }

  mapAttr Method evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "method", value: prop' value }

instance Attr Tags.TextPath_ Method String where
  pureAttr Method value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "method", value }

  mapAttr Method evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "method", value: prop' value }

instance Attr everything Method Unit where
  pureAttr Method _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "method", value: unset' }
  mapAttr Method evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "method", value: unset' }
