module Deku.DOM.Attr.StrokeLinecap where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data StrokeLinecap = StrokeLinecap

instance Attr Tags.Circle_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.ClipPath_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Defs_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Ellipse_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeBlend_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeColorMatrix_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeComponentTransfer_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeComposite_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeDisplacementMap_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeFlood_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeGaussianBlur_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeImage_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeMerge_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeMorphology_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeOffset_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeSpecularLighting_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeTile_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.FeTurbulence_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Filter_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.ForeignObject_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.G_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Image_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Line_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.LinearGradient_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Marker_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Mask_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Path_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Pattern_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Polygon_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Polyline_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.RadialGradient_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Rect_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Svg_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Switch_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Symbol_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Text_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.TextPath_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Tspan_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr Tags.Use_ StrokeLinecap String where
  pureAttr StrokeLinecap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-linecap", value }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: prop' value }

instance Attr everything StrokeLinecap Unit where
  pureAttr StrokeLinecap _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: unset' }
  mapAttr StrokeLinecap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-linecap", value: unset' }
