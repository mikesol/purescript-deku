module Deku.DOM.Attr.ClipPathUnits where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ClipPathUnits = ClipPathUnits

instance Attr Tags.ClipPath_ ClipPathUnits String where
  pureAttr ClipPathUnits value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clipPathUnits", value }
  mapAttr ClipPathUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "clipPathUnits", value: prop' value }

instance Attr everything ClipPathUnits Unit where
  pureAttr ClipPathUnits _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "clipPathUnits", value: unset' }
  mapAttr ClipPathUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "clipPathUnits", value: unset' }
