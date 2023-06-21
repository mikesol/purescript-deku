module Deku.DOM.Attr.AriaLabel where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaLabel = AriaLabel

instance Attr Tags.Circle_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.Ellipse_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.ForeignObject_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.G_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.Line_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.Marker_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.Path_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.Polygon_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.Polyline_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.Rect_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.Svg_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.Symbol_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.Text_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.TextPath_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.Tspan_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.Use_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr Tags.View_ AriaLabel String where
  pureAttr AriaLabel value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-label", value }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: prop' value }

instance Attr everything AriaLabel Unit where
  pureAttr AriaLabel _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-label", value: unset' }
  mapAttr AriaLabel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-label", value: unset' }
