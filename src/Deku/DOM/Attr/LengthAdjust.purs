module Deku.DOM.Attr.LengthAdjust where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data LengthAdjust = LengthAdjust

instance Attr Tags.Text_ LengthAdjust String where
  pureAttr LengthAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lengthAdjust", value }
  mapAttr LengthAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lengthAdjust", value: prop' value }

instance Attr Tags.TextPath_ LengthAdjust String where
  pureAttr LengthAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lengthAdjust", value }
  mapAttr LengthAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lengthAdjust", value: prop' value }

instance Attr Tags.Tspan_ LengthAdjust String where
  pureAttr LengthAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lengthAdjust", value }
  mapAttr LengthAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lengthAdjust", value: prop' value }

instance Attr everything LengthAdjust Unit where
  pureAttr LengthAdjust _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "lengthAdjust", value: unset' }
  mapAttr LengthAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lengthAdjust", value: unset' }
