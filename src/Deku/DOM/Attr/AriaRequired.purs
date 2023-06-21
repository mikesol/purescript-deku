module Deku.DOM.Attr.AriaRequired where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaRequired = AriaRequired

instance Attr Tags.Circle_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.Ellipse_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.ForeignObject_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.G_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.Line_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.Marker_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.Path_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.Polygon_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.Polyline_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.Rect_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.Svg_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.Symbol_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.Text_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.TextPath_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.Tspan_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.Use_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr Tags.View_ AriaRequired String where
  pureAttr AriaRequired value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-required", value }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: prop' value }

instance Attr everything AriaRequired Unit where
  pureAttr AriaRequired _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-required", value: unset' }
  mapAttr AriaRequired evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-required", value: unset' }
