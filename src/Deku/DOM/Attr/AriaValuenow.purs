module Deku.DOM.Attr.AriaValuenow where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaValuenow = AriaValuenow

instance Attr Tags.Circle_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.Ellipse_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.ForeignObject_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.G_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.Line_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.Marker_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.Path_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.Polygon_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.Polyline_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.Rect_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.Svg_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.Symbol_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.Text_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.TextPath_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.Tspan_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.Use_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr Tags.View_ AriaValuenow String where
  pureAttr AriaValuenow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuenow", value }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: prop' value }

instance Attr everything AriaValuenow Unit where
  pureAttr AriaValuenow _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: unset' }
  mapAttr AriaValuenow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuenow", value: unset' }
