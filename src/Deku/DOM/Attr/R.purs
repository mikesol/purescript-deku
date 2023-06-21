module Deku.DOM.Attr.R where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data R = R

instance Attr Tags.Circle_ R String where
  pureAttr R value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "r", value }

  mapAttr R evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "r", value: prop' value }

instance Attr Tags.RadialGradient_ R String where
  pureAttr R value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "r", value }

  mapAttr R evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "r", value: prop' value }

instance Attr everything R Unit where
  pureAttr R _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "r", value: unset' }
  mapAttr R evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "r", value: unset' }
