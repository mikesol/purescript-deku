module Deku.DOM.Attr.Color where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Color = Color

instance Attr Tags.Font_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Hr_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Circle_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.ClipPath_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Defs_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Ellipse_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeBlend_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeColorMatrix_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeComposite_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeFlood_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeImage_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeMerge_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeMorphology_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeOffset_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeTile_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.FeTurbulence_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Filter_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.ForeignObject_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.G_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Image_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Line_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.LinearGradient_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Marker_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Mask_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Path_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Pattern_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Polygon_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Polyline_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.RadialGradient_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Rect_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Stop_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Svg_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Switch_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Symbol_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Text_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.TextPath_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Tspan_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr Tags.Use_ Color String where
  pureAttr Color value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color", value }

  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "color", value: prop' value }

instance Attr everything Color Unit where
  pureAttr Color _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "color", value: unset' }
  mapAttr Color evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color", value: unset' }
