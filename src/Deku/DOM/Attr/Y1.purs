module Deku.DOM.Attr.Y1 where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Y1 = Y1

instance Attr Tags.Line_ Y1 String where
  pureAttr Y1 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y1", value }

  mapAttr Y1 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y1", value: prop' value }

instance Attr Tags.LinearGradient_ Y1 String where
  pureAttr Y1 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y1", value }

  mapAttr Y1 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y1", value: prop' value }

instance Attr everything Y1 Unit where
  pureAttr Y1 _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "y1", value: unset' }
  mapAttr Y1 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "y1", value: unset' }
