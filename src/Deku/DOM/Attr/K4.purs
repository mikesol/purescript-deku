module Deku.DOM.Attr.K4 where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data K4 = K4

instance Attr Tags.FeComposite_ K4 String where
  pureAttr K4 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "k4", value }

  mapAttr K4 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "k4", value: prop' value }

instance Attr everything K4 Unit where
  pureAttr K4 _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "k4", value: unset' }
  mapAttr K4 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "k4", value: unset' }
