module Deku.DOM.Attr.AriaDropeffect where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaDropeffect = AriaDropeffect

instance Attr Tags.Circle_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.Ellipse_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.ForeignObject_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.G_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.Line_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.Marker_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.Path_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.Polygon_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.Polyline_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.Rect_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.Svg_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.Symbol_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.Text_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.TextPath_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.Tspan_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.Use_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr Tags.View_ AriaDropeffect String where
  pureAttr AriaDropeffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-dropeffect", value }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: prop' value }

instance Attr everything AriaDropeffect Unit where
  pureAttr AriaDropeffect _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: unset' }
  mapAttr AriaDropeffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-dropeffect", value: unset' }
