module Deku.DOM.Attr.List where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data List = List

instance Attr Tags.Input_ List String where
  pureAttr List value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "list", value }

  mapAttr List evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "list", value: prop' value }

instance Attr everything List Unit where
  pureAttr List _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "list", value: unset' }
  mapAttr List evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "list", value: unset' }
