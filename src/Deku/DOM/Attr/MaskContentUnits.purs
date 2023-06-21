module Deku.DOM.Attr.MaskContentUnits where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data MaskContentUnits = MaskContentUnits

instance Attr Tags.Mask_ MaskContentUnits String where
  pureAttr MaskContentUnits value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "maskContentUnits", value }
  mapAttr MaskContentUnits evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "maskContentUnits", value: prop' value }

instance Attr everything MaskContentUnits Unit where
  pureAttr MaskContentUnits _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "maskContentUnits", value: unset' }
  mapAttr MaskContentUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "maskContentUnits", value: unset' }
