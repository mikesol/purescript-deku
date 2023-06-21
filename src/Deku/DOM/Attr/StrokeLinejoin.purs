module Deku.DOM.Attr.StrokeLinejoin where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data StrokeLinejoin = StrokeLinejoin

instance Attr Tags.Circle_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.ClipPath_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Defs_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Ellipse_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeBlend_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeColorMatrix_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeComponentTransfer_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeComposite_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeDisplacementMap_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeFlood_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeGaussianBlur_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeImage_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeMerge_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeMorphology_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeOffset_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeSpecularLighting_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeTile_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.FeTurbulence_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Filter_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.ForeignObject_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.G_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Image_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Line_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.LinearGradient_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Marker_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Mask_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Path_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Pattern_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Polygon_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Polyline_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.RadialGradient_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Rect_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Svg_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Switch_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Symbol_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Text_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.TextPath_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Tspan_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr Tags.Use_ StrokeLinejoin String where
  pureAttr StrokeLinejoin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linejoin", value }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: prop' value }

instance Attr everything StrokeLinejoin Unit where
  pureAttr StrokeLinejoin _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: unset' }
  mapAttr StrokeLinejoin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linejoin", value: unset' }
