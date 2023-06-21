module Deku.DOM.Attr.Cx where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Cx = Cx

instance Attr Tags.Circle_ Cx String where
  pureAttr Cx value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cx", value }

  mapAttr Cx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cx", value: prop' value }

instance Attr Tags.Ellipse_ Cx String where
  pureAttr Cx value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cx", value }

  mapAttr Cx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cx", value: prop' value }

instance Attr Tags.RadialGradient_ Cx String where
  pureAttr Cx value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cx", value }

  mapAttr Cx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cx", value: prop' value }

instance Attr everything Cx Unit where
  pureAttr Cx _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "cx", value: unset' }
  mapAttr Cx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "cx", value: unset' }
