module Deku.DOM.Attr.Y2 where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Y2 = Y2

instance Attr Tags.Line_ Y2 String where
  pureAttr Y2 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y2", value }

  mapAttr Y2 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y2", value: prop' value }

instance Attr Tags.LinearGradient_ Y2 String where
  pureAttr Y2 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y2", value }

  mapAttr Y2 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y2", value: prop' value }

instance Attr everything Y2 Unit where
  pureAttr Y2 _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "y2", value: unset' }
  mapAttr Y2 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "y2", value: unset' }
