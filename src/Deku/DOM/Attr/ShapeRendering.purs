module Deku.DOM.Attr.ShapeRendering where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ShapeRendering = ShapeRendering

instance Attr Tags.Circle_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.ClipPath_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Defs_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Ellipse_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeBlend_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeColorMatrix_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeComponentTransfer_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeComposite_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeDisplacementMap_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeFlood_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeGaussianBlur_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeImage_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeMerge_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeMorphology_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeOffset_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeSpecularLighting_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeTile_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.FeTurbulence_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Filter_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.ForeignObject_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.G_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Image_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Line_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.LinearGradient_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Marker_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Mask_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Path_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Pattern_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Polygon_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Polyline_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.RadialGradient_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Rect_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Svg_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Switch_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Symbol_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Text_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.TextPath_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Tspan_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr Tags.Use_ ShapeRendering String where
  pureAttr ShapeRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape-rendering", value }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: prop' value }

instance Attr everything ShapeRendering Unit where
  pureAttr ShapeRendering _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "shape-rendering", value: unset' }
  mapAttr ShapeRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape-rendering", value: unset' }
