module Deku.DOM.Attr.AriaLevel where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaLevel = AriaLevel

instance Attr Tags.Circle_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.Ellipse_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.ForeignObject_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.G_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.Line_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.Marker_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.Path_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.Polygon_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.Polyline_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.Rect_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.Svg_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.Symbol_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.Text_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.TextPath_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.Tspan_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.Use_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr Tags.View_ AriaLevel String where
  pureAttr AriaLevel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-level", value }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: prop' value }

instance Attr everything AriaLevel Unit where
  pureAttr AriaLevel _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-level", value: unset' }
  mapAttr AriaLevel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-level", value: unset' }
