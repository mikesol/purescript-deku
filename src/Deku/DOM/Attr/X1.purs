module Deku.DOM.Attr.X1 where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data X1 = X1

instance Attr Tags.Line_ X1 String where
  pureAttr X1 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x1", value }

  mapAttr X1 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x1", value: prop' value }

instance Attr Tags.LinearGradient_ X1 String where
  pureAttr X1 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x1", value }

  mapAttr X1 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x1", value: prop' value }

instance Attr everything X1 Unit where
  pureAttr X1 _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "x1", value: unset' }
  mapAttr X1 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "x1", value: unset' }
