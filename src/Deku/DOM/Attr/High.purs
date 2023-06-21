module Deku.DOM.Attr.High where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data High = High

instance Attr Tags.Meter_ High String where
  pureAttr High value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "high", value }

  mapAttr High evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "high", value: prop' value }

instance Attr everything High Unit where
  pureAttr High _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "high", value: unset' }
  mapAttr High evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "high", value: unset' }
