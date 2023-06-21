module Deku.DOM.Attr.AriaGrabbed where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaGrabbed = AriaGrabbed

instance Attr Tags.Circle_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.Ellipse_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.ForeignObject_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.G_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.Line_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.Marker_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.Path_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.Polygon_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.Polyline_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.Rect_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.Svg_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.Symbol_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.Text_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.TextPath_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.Tspan_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.Use_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr Tags.View_ AriaGrabbed String where
  pureAttr AriaGrabbed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-grabbed", value }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: prop' value }

instance Attr everything AriaGrabbed Unit where
  pureAttr AriaGrabbed _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: unset' }
  mapAttr AriaGrabbed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-grabbed", value: unset' }
