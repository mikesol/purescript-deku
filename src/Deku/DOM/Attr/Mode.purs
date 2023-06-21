module Deku.DOM.Attr.Mode where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Mode = Mode

instance Attr Tags.FeBlend_ Mode String where
  pureAttr Mode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mode", value }

  mapAttr Mode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mode", value: prop' value }

instance Attr everything Mode Unit where
  pureAttr Mode _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "mode", value: unset' }
  mapAttr Mode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mode", value: unset' }
