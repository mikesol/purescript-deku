module Deku.DOM.Attr.Side where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Side = Side

instance Attr Tags.TextPath_ Side String where
  pureAttr Side value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "side", value }

  mapAttr Side evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "side", value: prop' value }

instance Attr everything Side Unit where
  pureAttr Side _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "side", value: unset' }
  mapAttr Side evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "side", value: unset' }
