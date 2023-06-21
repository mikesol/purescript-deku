module Deku.DOM.Attr.AriaMultiline where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaMultiline = AriaMultiline

instance Attr Tags.Circle_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.Ellipse_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.ForeignObject_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.G_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.Line_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.Marker_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.Path_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.Polygon_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.Polyline_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.Rect_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.Svg_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.Symbol_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.Text_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.TextPath_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.Tspan_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.Use_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr Tags.View_ AriaMultiline String where
  pureAttr AriaMultiline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-multiline", value }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: prop' value }

instance Attr everything AriaMultiline Unit where
  pureAttr AriaMultiline _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-multiline", value: unset' }
  mapAttr AriaMultiline evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-multiline", value: unset' }
