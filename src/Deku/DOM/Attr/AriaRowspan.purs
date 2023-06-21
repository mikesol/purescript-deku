module Deku.DOM.Attr.AriaRowspan where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaRowspan = AriaRowspan

instance Attr Tags.Circle_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.Ellipse_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.ForeignObject_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.G_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.Line_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.Marker_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.Path_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.Polygon_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.Polyline_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.Rect_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.Svg_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.Symbol_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.Text_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.TextPath_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.Tspan_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.Use_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr Tags.View_ AriaRowspan String where
  pureAttr AriaRowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowspan", value }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: prop' value }

instance Attr everything AriaRowspan Unit where
  pureAttr AriaRowspan _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: unset' }
  mapAttr AriaRowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowspan", value: unset' }
