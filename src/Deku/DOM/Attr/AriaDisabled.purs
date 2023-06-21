module Deku.DOM.Attr.AriaDisabled where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaDisabled = AriaDisabled

instance Attr Tags.Circle_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.Ellipse_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.ForeignObject_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.G_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.Line_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.Marker_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.Path_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.Polygon_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.Polyline_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.Rect_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.Svg_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.Symbol_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.Text_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.TextPath_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.Tspan_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.Use_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr Tags.View_ AriaDisabled String where
  pureAttr AriaDisabled value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-disabled", value }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: prop' value }

instance Attr everything AriaDisabled Unit where
  pureAttr AriaDisabled _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-disabled", value: unset' }
  mapAttr AriaDisabled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-disabled", value: unset' }
