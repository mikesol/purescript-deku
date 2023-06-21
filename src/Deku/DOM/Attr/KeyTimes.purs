module Deku.DOM.Attr.KeyTimes where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data KeyTimes = KeyTimes

instance Attr Tags.Animate_ KeyTimes String where
  pureAttr KeyTimes value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keyTimes", value }

  mapAttr KeyTimes evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keyTimes", value: prop' value }

instance Attr Tags.AnimateMotion_ KeyTimes String where
  pureAttr KeyTimes value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keyTimes", value }

  mapAttr KeyTimes evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keyTimes", value: prop' value }

instance Attr Tags.AnimateTransform_ KeyTimes String where
  pureAttr KeyTimes value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keyTimes", value }

  mapAttr KeyTimes evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keyTimes", value: prop' value }

instance Attr everything KeyTimes Unit where
  pureAttr KeyTimes _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "keyTimes", value: unset' }
  mapAttr KeyTimes evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keyTimes", value: unset' }
