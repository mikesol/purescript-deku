module Deku.DOM.Attr.SpecularConstant where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data SpecularConstant = SpecularConstant

instance Attr Tags.FeSpecularLighting_ SpecularConstant String where
  pureAttr SpecularConstant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "specularConstant", value }
  mapAttr SpecularConstant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "specularConstant", value: prop' value }

instance Attr everything SpecularConstant Unit where
  pureAttr SpecularConstant _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "specularConstant", value: unset' }
  mapAttr SpecularConstant evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "specularConstant", value: unset' }
