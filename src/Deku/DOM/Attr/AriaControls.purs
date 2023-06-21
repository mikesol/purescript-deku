module Deku.DOM.Attr.AriaControls where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaControls = AriaControls

instance Attr Tags.Circle_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.Ellipse_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.ForeignObject_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.G_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.Line_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.Marker_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.Path_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.Polygon_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.Polyline_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.Rect_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.Svg_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.Symbol_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.Text_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.TextPath_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.Tspan_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.Use_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr Tags.View_ AriaControls String where
  pureAttr AriaControls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-controls", value }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: prop' value }

instance Attr everything AriaControls Unit where
  pureAttr AriaControls _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-controls", value: unset' }
  mapAttr AriaControls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-controls", value: unset' }
