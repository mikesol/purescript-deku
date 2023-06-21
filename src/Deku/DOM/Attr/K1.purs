module Deku.DOM.Attr.K1 where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data K1 = K1

instance Attr Tags.FeComposite_ K1 String where
  pureAttr K1 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "k1", value }

  mapAttr K1 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "k1", value: prop' value }

instance Attr everything K1 Unit where
  pureAttr K1 _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "k1", value: unset' }
  mapAttr K1 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "k1", value: unset' }
