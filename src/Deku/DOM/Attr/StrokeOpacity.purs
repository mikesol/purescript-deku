module Deku.DOM.Attr.StrokeOpacity where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data StrokeOpacity = StrokeOpacity

instance Attr Tags.Circle_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.ClipPath_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Defs_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Ellipse_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeBlend_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeColorMatrix_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeComponentTransfer_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeComposite_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeDisplacementMap_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeFlood_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeGaussianBlur_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeImage_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeMerge_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeMorphology_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeOffset_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeSpecularLighting_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeTile_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.FeTurbulence_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Filter_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.ForeignObject_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.G_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Image_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Line_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.LinearGradient_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Marker_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Mask_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Path_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Pattern_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Polygon_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Polyline_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.RadialGradient_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Rect_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Svg_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Switch_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Symbol_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Text_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.TextPath_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Tspan_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr Tags.Use_ StrokeOpacity String where
  pureAttr StrokeOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-opacity", value }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: prop' value }

instance Attr everything StrokeOpacity Unit where
  pureAttr StrokeOpacity _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: unset' }
  mapAttr StrokeOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-opacity", value: unset' }
