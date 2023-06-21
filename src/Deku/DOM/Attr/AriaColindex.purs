module Deku.DOM.Attr.AriaColindex where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaColindex = AriaColindex

instance Attr Tags.Circle_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.Ellipse_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.ForeignObject_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.G_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.Line_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.Marker_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.Path_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.Polygon_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.Polyline_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.Rect_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.Svg_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.Symbol_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.Text_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.TextPath_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.Tspan_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.Use_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr Tags.View_ AriaColindex String where
  pureAttr AriaColindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colindex", value }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: prop' value }

instance Attr everything AriaColindex Unit where
  pureAttr AriaColindex _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-colindex", value: unset' }
  mapAttr AriaColindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colindex", value: unset' }
