module Deku.DOM.Attr.XlinkTitle where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data XlinkTitle = XlinkTitle

instance Attr Tags.AnimateTransform_ XlinkTitle String where
  pureAttr XlinkTitle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:title", value }
  mapAttr XlinkTitle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:title", value: prop' value }

instance Attr Tags.FeImage_ XlinkTitle String where
  pureAttr XlinkTitle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:title", value }
  mapAttr XlinkTitle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:title", value: prop' value }

instance Attr Tags.Filter_ XlinkTitle String where
  pureAttr XlinkTitle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:title", value }
  mapAttr XlinkTitle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:title", value: prop' value }

instance Attr Tags.Image_ XlinkTitle String where
  pureAttr XlinkTitle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:title", value }
  mapAttr XlinkTitle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:title", value: prop' value }

instance Attr Tags.LinearGradient_ XlinkTitle String where
  pureAttr XlinkTitle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:title", value }
  mapAttr XlinkTitle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:title", value: prop' value }

instance Attr Tags.Mpath_ XlinkTitle String where
  pureAttr XlinkTitle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:title", value }
  mapAttr XlinkTitle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:title", value: prop' value }

instance Attr Tags.Pattern_ XlinkTitle String where
  pureAttr XlinkTitle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:title", value }
  mapAttr XlinkTitle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:title", value: prop' value }

instance Attr Tags.RadialGradient_ XlinkTitle String where
  pureAttr XlinkTitle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:title", value }
  mapAttr XlinkTitle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:title", value: prop' value }

instance Attr everything XlinkTitle Unit where
  pureAttr XlinkTitle _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "xlink:title", value: unset' }
  mapAttr XlinkTitle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:title", value: unset' }
