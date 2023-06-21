module Deku.DOM.Attr.Additive where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Additive = Additive

instance Attr Tags.Animate_ Additive String where
  pureAttr Additive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "additive", value }

  mapAttr Additive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "additive", value: prop' value }

instance Attr Tags.AnimateMotion_ Additive String where
  pureAttr Additive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "additive", value }

  mapAttr Additive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "additive", value: prop' value }

instance Attr Tags.AnimateTransform_ Additive String where
  pureAttr Additive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "additive", value }

  mapAttr Additive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "additive", value: prop' value }

instance Attr everything Additive Unit where
  pureAttr Additive _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "additive", value: unset' }
  mapAttr Additive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "additive", value: unset' }
