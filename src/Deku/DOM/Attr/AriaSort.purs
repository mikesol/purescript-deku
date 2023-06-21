module Deku.DOM.Attr.AriaSort where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaSort = AriaSort

instance Attr Tags.Circle_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.Ellipse_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.ForeignObject_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.G_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.Line_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.Marker_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.Path_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.Polygon_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.Polyline_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.Rect_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.Svg_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.Symbol_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.Text_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.TextPath_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.Tspan_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.Use_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr Tags.View_ AriaSort String where
  pureAttr AriaSort value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-sort", value }

  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-sort", value: prop' value }

instance Attr everything AriaSort Unit where
  pureAttr AriaSort _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "aria-sort", value: unset' }
  mapAttr AriaSort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-sort", value: unset' }
