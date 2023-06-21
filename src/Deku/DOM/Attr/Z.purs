module Deku.DOM.Attr.Z where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Z = Z

instance Attr Tags.FePointLight_ Z String where
  pureAttr Z value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "z", value }

  mapAttr Z evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "z", value: prop' value }

instance Attr Tags.FeSpotLight_ Z String where
  pureAttr Z value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "z", value }

  mapAttr Z evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "z", value: prop' value }

instance Attr everything Z Unit where
  pureAttr Z _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "z", value: unset' }
  mapAttr Z evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "z", value: unset' }
