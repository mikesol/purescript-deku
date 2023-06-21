module Deku.DOM.Attr.MaskUnits where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data MaskUnits = MaskUnits

instance Attr Tags.Mask_ MaskUnits String where
  pureAttr MaskUnits value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "maskUnits", value }
  mapAttr MaskUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "maskUnits", value: prop' value }

instance Attr everything MaskUnits Unit where
  pureAttr MaskUnits _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "maskUnits", value: unset' }
  mapAttr MaskUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "maskUnits", value: unset' }
