module Deku.DOM.Attr.DiffuseConstant where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data DiffuseConstant = DiffuseConstant

instance Attr Tags.FeDiffuseLighting_ DiffuseConstant String where
  pureAttr DiffuseConstant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "diffuseConstant", value }
  mapAttr DiffuseConstant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "diffuseConstant", value: prop' value }

instance Attr everything DiffuseConstant Unit where
  pureAttr DiffuseConstant _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "diffuseConstant", value: unset' }
  mapAttr DiffuseConstant evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "diffuseConstant", value: unset' }
