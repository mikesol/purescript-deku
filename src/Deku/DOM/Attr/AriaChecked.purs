module Deku.DOM.Attr.AriaChecked where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaChecked = AriaChecked

instance Attr Tags.Circle_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.Ellipse_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.ForeignObject_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.G_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.Line_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.Marker_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.Path_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.Polygon_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.Polyline_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.Rect_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.Svg_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.Symbol_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.Text_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.TextPath_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.Tspan_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.Use_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr Tags.View_ AriaChecked String where
  pureAttr AriaChecked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-checked", value }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: prop' value }

instance Attr everything AriaChecked Unit where
  pureAttr AriaChecked _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-checked", value: unset' }
  mapAttr AriaChecked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-checked", value: unset' }
