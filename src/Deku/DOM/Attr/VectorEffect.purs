module Deku.DOM.Attr.VectorEffect where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data VectorEffect = VectorEffect

instance Attr Tags.Circle_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.ClipPath_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Defs_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Ellipse_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeBlend_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeColorMatrix_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeComponentTransfer_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeComposite_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeDisplacementMap_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeFlood_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeGaussianBlur_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeImage_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeMerge_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeMorphology_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeOffset_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeSpecularLighting_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeTile_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.FeTurbulence_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Filter_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.ForeignObject_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.G_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Image_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Line_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.LinearGradient_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Marker_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Mask_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Path_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Pattern_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Polygon_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Polyline_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.RadialGradient_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Rect_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Svg_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Switch_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Symbol_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Text_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.TextPath_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Tspan_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr Tags.Use_ VectorEffect String where
  pureAttr VectorEffect value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "vector-effect", value }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: prop' value }

instance Attr everything VectorEffect Unit where
  pureAttr VectorEffect _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "vector-effect", value: unset' }
  mapAttr VectorEffect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "vector-effect", value: unset' }
