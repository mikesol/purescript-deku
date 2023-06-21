module Deku.DOM.Attr.End where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data End = End

instance Attr Tags.Animate_ End String where
  pureAttr End value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "end", value }

  mapAttr End evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "end", value: prop' value }

instance Attr Tags.AnimateMotion_ End String where
  pureAttr End value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "end", value }

  mapAttr End evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "end", value: prop' value }

instance Attr Tags.AnimateTransform_ End String where
  pureAttr End value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "end", value }

  mapAttr End evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "end", value: prop' value }

instance Attr Tags.Set_ End String where
  pureAttr End value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "end", value }

  mapAttr End evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "end", value: prop' value }

instance Attr everything End Unit where
  pureAttr End _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "end", value: unset' }
  mapAttr End evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "end", value: unset' }
