module Deku.DOM.Attr.AriaSelected where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaSelected = AriaSelected

instance Attr Tags.Circle_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.Ellipse_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.ForeignObject_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.G_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.Line_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.Marker_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.Path_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.Polygon_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.Polyline_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.Rect_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.Svg_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.Symbol_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.Text_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.TextPath_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.Tspan_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.Use_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr Tags.View_ AriaSelected String where
  pureAttr AriaSelected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-selected", value }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: prop' value }

instance Attr everything AriaSelected Unit where
  pureAttr AriaSelected _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-selected", value: unset' }
  mapAttr AriaSelected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-selected", value: unset' }
