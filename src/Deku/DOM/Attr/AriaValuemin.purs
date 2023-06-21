module Deku.DOM.Attr.AriaValuemin where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaValuemin = AriaValuemin

instance Attr Tags.Circle_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.Ellipse_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.ForeignObject_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.G_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.Line_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.Marker_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.Path_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.Polygon_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.Polyline_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.Rect_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.Svg_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.Symbol_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.Text_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.TextPath_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.Tspan_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.Use_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr Tags.View_ AriaValuemin String where
  pureAttr AriaValuemin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuemin", value }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: prop' value }

instance Attr everything AriaValuemin Unit where
  pureAttr AriaValuemin _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: unset' }
  mapAttr AriaValuemin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuemin", value: unset' }
