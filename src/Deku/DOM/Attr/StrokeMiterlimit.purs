module Deku.DOM.Attr.StrokeMiterlimit where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data StrokeMiterlimit = StrokeMiterlimit

instance Attr Tags.Circle_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.ClipPath_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Defs_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Ellipse_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeBlend_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeColorMatrix_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeComponentTransfer_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeComposite_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeDisplacementMap_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeFlood_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeGaussianBlur_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeImage_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeMerge_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeMorphology_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeOffset_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeSpecularLighting_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeTile_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.FeTurbulence_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Filter_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.ForeignObject_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.G_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Image_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Line_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.LinearGradient_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Marker_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Mask_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Path_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Pattern_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Polygon_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Polyline_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.RadialGradient_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Rect_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Svg_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Switch_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Symbol_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Text_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.TextPath_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Tspan_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr Tags.Use_ StrokeMiterlimit String where
  pureAttr StrokeMiterlimit value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke-miterlimit", value }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: prop' value }

instance Attr everything StrokeMiterlimit Unit where
  pureAttr StrokeMiterlimit _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "stroke-miterlimit", value: unset' }
  mapAttr StrokeMiterlimit evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "stroke-miterlimit", value: unset' }
