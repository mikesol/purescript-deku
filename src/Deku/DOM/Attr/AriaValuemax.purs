module Deku.DOM.Attr.AriaValuemax where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaValuemax = AriaValuemax

instance Attr Tags.Circle_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.Ellipse_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.ForeignObject_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.G_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.Line_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.Marker_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.Path_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.Polygon_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.Polyline_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.Rect_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.Svg_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.Symbol_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.Text_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.TextPath_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.Tspan_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.Use_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr Tags.View_ AriaValuemax String where
  pureAttr AriaValuemax value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemax", value }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: prop' value }

instance Attr everything AriaValuemax Unit where
  pureAttr AriaValuemax _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: unset' }
  mapAttr AriaValuemax evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemax", value: unset' }
