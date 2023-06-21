module Deku.DOM.Attr.AriaRowindex where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaRowindex = AriaRowindex

instance Attr Tags.Circle_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.Ellipse_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.ForeignObject_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.G_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.Line_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.Marker_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.Path_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.Polygon_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.Polyline_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.Rect_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.Svg_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.Symbol_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.Text_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.TextPath_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.Tspan_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.Use_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr Tags.View_ AriaRowindex String where
  pureAttr AriaRowindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowindex", value }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: prop' value }

instance Attr everything AriaRowindex Unit where
  pureAttr AriaRowindex _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: unset' }
  mapAttr AriaRowindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowindex", value: unset' }
