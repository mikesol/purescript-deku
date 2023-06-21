module Deku.DOM.Attr.XlinkHref where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data XlinkHref = XlinkHref

instance Attr Tags.AnimateTransform_ XlinkHref String where
  pureAttr XlinkHref value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:href", value }
  mapAttr XlinkHref evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:href", value: prop' value }

instance Attr Tags.FeImage_ XlinkHref String where
  pureAttr XlinkHref value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:href", value }
  mapAttr XlinkHref evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:href", value: prop' value }

instance Attr Tags.Filter_ XlinkHref String where
  pureAttr XlinkHref value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:href", value }
  mapAttr XlinkHref evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:href", value: prop' value }

instance Attr Tags.Image_ XlinkHref String where
  pureAttr XlinkHref value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:href", value }
  mapAttr XlinkHref evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:href", value: prop' value }

instance Attr Tags.LinearGradient_ XlinkHref String where
  pureAttr XlinkHref value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:href", value }
  mapAttr XlinkHref evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:href", value: prop' value }

instance Attr Tags.Mpath_ XlinkHref String where
  pureAttr XlinkHref value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:href", value }
  mapAttr XlinkHref evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:href", value: prop' value }

instance Attr Tags.Pattern_ XlinkHref String where
  pureAttr XlinkHref value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:href", value }
  mapAttr XlinkHref evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:href", value: prop' value }

instance Attr Tags.RadialGradient_ XlinkHref String where
  pureAttr XlinkHref value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:href", value }
  mapAttr XlinkHref evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:href", value: prop' value }

instance Attr Tags.Use_ XlinkHref String where
  pureAttr XlinkHref value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:href", value }
  mapAttr XlinkHref evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:href", value: prop' value }

instance Attr everything XlinkHref Unit where
  pureAttr XlinkHref _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "xlink:href", value: unset' }
  mapAttr XlinkHref evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:href", value: unset' }
