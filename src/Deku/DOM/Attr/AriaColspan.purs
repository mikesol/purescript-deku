module Deku.DOM.Attr.AriaColspan where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaColspan = AriaColspan

instance Attr Tags.Circle_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.Ellipse_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.ForeignObject_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.G_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.Line_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.Marker_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.Path_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.Polygon_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.Polyline_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.Rect_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.Svg_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.Symbol_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.Text_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.TextPath_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.Tspan_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.Use_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr Tags.View_ AriaColspan String where
  pureAttr AriaColspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colspan", value }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: prop' value }

instance Attr everything AriaColspan Unit where
  pureAttr AriaColspan _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-colspan", value: unset' }
  mapAttr AriaColspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colspan", value: unset' }
