module Deku.DOM.Attr.StrokeDasharray where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data StrokeDasharray = StrokeDasharray

instance Attr Tags.Circle_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.ClipPath_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Defs_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Ellipse_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeBlend_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeColorMatrix_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeComponentTransfer_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeComposite_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeDisplacementMap_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeFlood_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeGaussianBlur_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeImage_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeMerge_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeMorphology_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeOffset_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeSpecularLighting_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeTile_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.FeTurbulence_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Filter_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.ForeignObject_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.G_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Image_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Line_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.LinearGradient_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Marker_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Mask_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Path_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Pattern_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Polygon_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Polyline_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.RadialGradient_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Rect_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Svg_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Switch_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Symbol_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Text_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.TextPath_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Tspan_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr Tags.Use_ StrokeDasharray String where
  pureAttr StrokeDasharray value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dasharray", value }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dasharray", value: prop' value }

instance Attr everything StrokeDasharray Unit where
  pureAttr StrokeDasharray _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "stroke-dasharray", value: unset' }
  mapAttr StrokeDasharray evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-dasharray", value: unset' }
