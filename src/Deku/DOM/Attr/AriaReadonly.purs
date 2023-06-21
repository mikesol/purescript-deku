module Deku.DOM.Attr.AriaReadonly where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaReadonly = AriaReadonly

instance Attr Tags.Circle_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.Ellipse_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.ForeignObject_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.G_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.Line_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.Marker_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.Path_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.Polygon_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.Polyline_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.Rect_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.Svg_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.Symbol_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.Text_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.TextPath_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.Tspan_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.Use_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr Tags.View_ AriaReadonly String where
  pureAttr AriaReadonly value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-readonly", value }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: prop' value }

instance Attr everything AriaReadonly Unit where
  pureAttr AriaReadonly _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-readonly", value: unset' }
  mapAttr AriaReadonly evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-readonly", value: unset' }
