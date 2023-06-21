module Deku.DOM.Attr.AriaPressed where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaPressed = AriaPressed

instance Attr Tags.Circle_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.Ellipse_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.ForeignObject_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.G_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.Line_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.Marker_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.Path_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.Polygon_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.Polyline_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.Rect_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.Svg_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.Symbol_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.Text_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.TextPath_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.Tspan_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.Use_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr Tags.View_ AriaPressed String where
  pureAttr AriaPressed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-pressed", value }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: prop' value }

instance Attr everything AriaPressed Unit where
  pureAttr AriaPressed _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-pressed", value: unset' }
  mapAttr AriaPressed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-pressed", value: unset' }
