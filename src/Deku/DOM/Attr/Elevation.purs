module Deku.DOM.Attr.Elevation where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Elevation = Elevation

instance Attr Tags.FeDistantLight_ Elevation String where
  pureAttr Elevation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "elevation", value }
  mapAttr Elevation evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "elevation", value: prop' value }

instance Attr everything Elevation Unit where
  pureAttr Elevation _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "elevation", value: unset' }
  mapAttr Elevation evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "elevation", value: unset' }
