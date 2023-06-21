module Deku.DOM.Attr.XlinkType where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data XlinkType = XlinkType

instance Attr Tags.AnimateTransform_ XlinkType String where
  pureAttr XlinkType value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:type", value }
  mapAttr XlinkType evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:type", value: prop' value }

instance Attr Tags.FeImage_ XlinkType String where
  pureAttr XlinkType value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:type", value }
  mapAttr XlinkType evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:type", value: prop' value }

instance Attr Tags.Filter_ XlinkType String where
  pureAttr XlinkType value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:type", value }
  mapAttr XlinkType evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:type", value: prop' value }

instance Attr Tags.Image_ XlinkType String where
  pureAttr XlinkType value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:type", value }
  mapAttr XlinkType evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:type", value: prop' value }

instance Attr Tags.Mpath_ XlinkType String where
  pureAttr XlinkType value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:type", value }
  mapAttr XlinkType evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:type", value: prop' value }

instance Attr everything XlinkType Unit where
  pureAttr XlinkType _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "xlink:type", value: unset' }
  mapAttr XlinkType evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:type", value: unset' }
