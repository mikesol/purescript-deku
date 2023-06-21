module Deku.DOM.Attr.AriaHidden where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaHidden = AriaHidden

instance Attr Tags.Circle_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.Ellipse_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.ForeignObject_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.G_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.Line_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.Marker_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.Path_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.Polygon_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.Polyline_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.Rect_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.Svg_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.Symbol_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.Text_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.TextPath_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.Tspan_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.Use_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr Tags.View_ AriaHidden String where
  pureAttr AriaHidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-hidden", value }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: prop' value }

instance Attr everything AriaHidden Unit where
  pureAttr AriaHidden _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-hidden", value: unset' }
  mapAttr AriaHidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-hidden", value: unset' }
