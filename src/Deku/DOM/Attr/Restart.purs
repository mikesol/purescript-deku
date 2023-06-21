module Deku.DOM.Attr.Restart where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Restart = Restart

instance Attr Tags.Animate_ Restart String where
  pureAttr Restart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "restart", value }

  mapAttr Restart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "restart", value: prop' value }

instance Attr Tags.AnimateMotion_ Restart String where
  pureAttr Restart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "restart", value }

  mapAttr Restart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "restart", value: prop' value }

instance Attr Tags.AnimateTransform_ Restart String where
  pureAttr Restart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "restart", value }

  mapAttr Restart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "restart", value: prop' value }

instance Attr Tags.Set_ Restart String where
  pureAttr Restart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "restart", value }

  mapAttr Restart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "restart", value: prop' value }

instance Attr everything Restart Unit where
  pureAttr Restart _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "restart", value: unset' }
  mapAttr Restart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "restart", value: unset' }
