module Deku.DOM.Attr.StrokeWidth where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data StrokeWidth = StrokeWidth

instance Attr Tags.Circle_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.ClipPath_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Defs_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Ellipse_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeBlend_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeColorMatrix_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeComponentTransfer_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeComposite_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeDisplacementMap_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeFlood_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeGaussianBlur_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeImage_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeMerge_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeMorphology_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeOffset_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeSpecularLighting_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeTile_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.FeTurbulence_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Filter_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.ForeignObject_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.G_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Image_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Line_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.LinearGradient_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Marker_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Mask_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Path_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Pattern_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Polygon_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Polyline_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.RadialGradient_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Rect_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Svg_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Switch_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Symbol_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Text_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.TextPath_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Tspan_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr Tags.Use_ StrokeWidth String where
  pureAttr StrokeWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-width", value }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: prop' value }

instance Attr everything StrokeWidth Unit where
  pureAttr StrokeWidth _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "stroke-width", value: unset' }
  mapAttr StrokeWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-width", value: unset' }
