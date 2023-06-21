module Deku.DOM.Attr.Display where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Display = Display

instance Attr Tags.Circle_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.ClipPath_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Defs_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Ellipse_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeBlend_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeColorMatrix_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeComposite_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeFlood_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeImage_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeMerge_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeMorphology_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeOffset_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeTile_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.FeTurbulence_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Filter_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.ForeignObject_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.G_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Image_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Line_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.LinearGradient_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Marker_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Mask_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Path_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Pattern_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Polygon_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Polyline_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.RadialGradient_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Rect_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Stop_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Svg_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Switch_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Symbol_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Text_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.TextPath_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Tspan_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr Tags.Use_ Display String where
  pureAttr Display value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "display", value }

  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "display", value: prop' value }

instance Attr everything Display Unit where
  pureAttr Display _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "display", value: unset' }
  mapAttr Display evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "display", value: unset' }
