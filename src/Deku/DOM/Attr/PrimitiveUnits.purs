module Deku.DOM.Attr.PrimitiveUnits where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data PrimitiveUnits = PrimitiveUnits

instance Attr Tags.Filter_ PrimitiveUnits String where
  pureAttr PrimitiveUnits value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "primitiveUnits", value }
  mapAttr PrimitiveUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "primitiveUnits", value: prop' value }

instance Attr everything PrimitiveUnits Unit where
  pureAttr PrimitiveUnits _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "primitiveUnits", value: unset' }
  mapAttr PrimitiveUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "primitiveUnits", value: unset' }
