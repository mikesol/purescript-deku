module Deku.DOM.Attr.X2 where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data X2 = X2

instance Attr Tags.Line_ X2 String where
  pureAttr X2 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x2", value }

  mapAttr X2 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x2", value: prop' value }

instance Attr Tags.LinearGradient_ X2 String where
  pureAttr X2 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x2", value }

  mapAttr X2 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x2", value: prop' value }

instance Attr everything X2 Unit where
  pureAttr X2 _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "x2", value: unset' }
  mapAttr X2 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "x2", value: unset' }
