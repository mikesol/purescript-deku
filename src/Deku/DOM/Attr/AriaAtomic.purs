module Deku.DOM.Attr.AriaAtomic where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaAtomic = AriaAtomic

instance Attr Tags.Circle_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.Ellipse_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.ForeignObject_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.G_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.Line_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.Marker_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.Path_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.Polygon_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.Polyline_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.Rect_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.Svg_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.Symbol_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.Text_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.TextPath_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.Tspan_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.Use_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr Tags.View_ AriaAtomic String where
  pureAttr AriaAtomic value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-atomic", value }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: prop' value }

instance Attr everything AriaAtomic Unit where
  pureAttr AriaAtomic _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-atomic", value: unset' }
  mapAttr AriaAtomic evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-atomic", value: unset' }
