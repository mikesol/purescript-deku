module Deku.DOM.Attr.AriaExpanded where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaExpanded = AriaExpanded

instance Attr Tags.Circle_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.Ellipse_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.ForeignObject_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.G_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.Line_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.Marker_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.Path_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.Polygon_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.Polyline_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.Rect_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.Svg_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.Symbol_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.Text_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.TextPath_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.Tspan_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.Use_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr Tags.View_ AriaExpanded String where
  pureAttr AriaExpanded value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-expanded", value }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: prop' value }

instance Attr everything AriaExpanded Unit where
  pureAttr AriaExpanded _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-expanded", value: unset' }
  mapAttr AriaExpanded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-expanded", value: unset' }
