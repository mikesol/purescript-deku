module Deku.DOM.Attr.KeySplines where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data KeySplines = KeySplines

instance Attr Tags.Animate_ KeySplines String where
  pureAttr KeySplines value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keySplines", value }
  mapAttr KeySplines evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keySplines", value: prop' value }

instance Attr Tags.AnimateMotion_ KeySplines String where
  pureAttr KeySplines value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keySplines", value }
  mapAttr KeySplines evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keySplines", value: prop' value }

instance Attr Tags.AnimateTransform_ KeySplines String where
  pureAttr KeySplines value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keySplines", value }
  mapAttr KeySplines evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keySplines", value: prop' value }

instance Attr everything KeySplines Unit where
  pureAttr KeySplines _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "keySplines", value: unset' }
  mapAttr KeySplines evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keySplines", value: unset' }
