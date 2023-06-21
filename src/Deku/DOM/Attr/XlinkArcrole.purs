module Deku.DOM.Attr.XlinkArcrole where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data XlinkArcrole = XlinkArcrole

instance Attr Tags.AnimateTransform_ XlinkArcrole String where
  pureAttr XlinkArcrole value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:arcrole", value }
  mapAttr XlinkArcrole evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:arcrole", value: prop' value }

instance Attr Tags.FeImage_ XlinkArcrole String where
  pureAttr XlinkArcrole value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:arcrole", value }
  mapAttr XlinkArcrole evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:arcrole", value: prop' value }

instance Attr Tags.Filter_ XlinkArcrole String where
  pureAttr XlinkArcrole value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:arcrole", value }
  mapAttr XlinkArcrole evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:arcrole", value: prop' value }

instance Attr Tags.Image_ XlinkArcrole String where
  pureAttr XlinkArcrole value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:arcrole", value }
  mapAttr XlinkArcrole evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:arcrole", value: prop' value }

instance Attr Tags.Mpath_ XlinkArcrole String where
  pureAttr XlinkArcrole value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:arcrole", value }
  mapAttr XlinkArcrole evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:arcrole", value: prop' value }

instance Attr everything XlinkArcrole Unit where
  pureAttr XlinkArcrole _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "xlink:arcrole", value: unset' }
  mapAttr XlinkArcrole evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:arcrole", value: unset' }
