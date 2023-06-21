module Deku.DOM.Attr.SpecularExponent where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data SpecularExponent = SpecularExponent

instance Attr Tags.FeSpecularLighting_ SpecularExponent String where
  pureAttr SpecularExponent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "specularExponent", value }
  mapAttr SpecularExponent evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "specularExponent", value: prop' value }

instance Attr Tags.FeSpotLight_ SpecularExponent String where
  pureAttr SpecularExponent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "specularExponent", value }
  mapAttr SpecularExponent evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "specularExponent", value: prop' value }

instance Attr everything SpecularExponent Unit where
  pureAttr SpecularExponent _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "specularExponent", value: unset' }
  mapAttr SpecularExponent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "specularExponent", value: unset' }
