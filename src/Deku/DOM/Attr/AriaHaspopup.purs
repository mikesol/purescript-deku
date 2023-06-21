module Deku.DOM.Attr.AriaHaspopup where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaHaspopup = AriaHaspopup

instance Attr Tags.Circle_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.Ellipse_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.ForeignObject_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.G_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.Line_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.Marker_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.Path_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.Polygon_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.Polyline_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.Rect_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.Svg_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.Symbol_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.Text_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.TextPath_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.Tspan_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.Use_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr Tags.View_ AriaHaspopup String where
  pureAttr AriaHaspopup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-haspopup", value }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: prop' value }

instance Attr everything AriaHaspopup Unit where
  pureAttr AriaHaspopup _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: unset' }
  mapAttr AriaHaspopup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-haspopup", value: unset' }
