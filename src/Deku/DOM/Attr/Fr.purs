module Deku.DOM.Attr.Fr where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Fr = Fr

instance Attr Tags.RadialGradient_ Fr String where
  pureAttr Fr value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fr", value }

  mapAttr Fr evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fr", value: prop' value }

instance Attr everything Fr Unit where
  pureAttr Fr _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "fr", value: unset' }
  mapAttr Fr evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fr", value: unset' }
