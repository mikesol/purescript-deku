module Deku.DOM.Attr.K2 where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data K2 = K2

instance Attr Tags.FeComposite_ K2 String where
  pureAttr K2 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "k2", value }

  mapAttr K2 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "k2", value: prop' value }

instance Attr everything K2 Unit where
  pureAttr K2 _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "k2", value: unset' }
  mapAttr K2 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "k2", value: unset' }
