module Deku.DOM.Attr.AriaLive where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaLive = AriaLive

instance Attr Tags.Circle_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.Ellipse_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.ForeignObject_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.G_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.Line_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.Marker_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.Path_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.Polygon_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.Polyline_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.Rect_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.Svg_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.Symbol_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.Text_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.TextPath_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.Tspan_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.Use_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr Tags.View_ AriaLive String where
  pureAttr AriaLive value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-live", value }

  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-live", value: prop' value }

instance Attr everything AriaLive Unit where
  pureAttr AriaLive _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "aria-live", value: unset' }
  mapAttr AriaLive evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-live", value: unset' }
