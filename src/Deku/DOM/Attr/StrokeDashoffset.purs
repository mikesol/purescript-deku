module Deku.DOM.Attr.StrokeDashoffset where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data StrokeDashoffset = StrokeDashoffset

instance Attr Tags.Circle_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.ClipPath_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Defs_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Ellipse_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeBlend_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeColorMatrix_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeComponentTransfer_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeComposite_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeDisplacementMap_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeFlood_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeGaussianBlur_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeImage_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeMerge_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeMorphology_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeOffset_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeSpecularLighting_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeTile_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.FeTurbulence_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Filter_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.ForeignObject_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.G_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Image_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Line_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.LinearGradient_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Marker_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Mask_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Path_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Pattern_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Polygon_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Polyline_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.RadialGradient_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Rect_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Svg_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Switch_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Symbol_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Text_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.TextPath_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Tspan_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr Tags.Use_ StrokeDashoffset String where
  pureAttr StrokeDashoffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-dashoffset", value }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: prop' value }

instance Attr everything StrokeDashoffset Unit where
  pureAttr StrokeDashoffset _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: unset' }
  mapAttr StrokeDashoffset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke-dashoffset", value: unset' }
