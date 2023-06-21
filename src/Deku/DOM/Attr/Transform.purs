module Deku.DOM.Attr.Transform where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Transform = Transform

instance Attr Tags.Circle_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.ClipPath_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Defs_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Ellipse_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeBlend_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeColorMatrix_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeComposite_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeFlood_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeImage_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeMerge_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeMorphology_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeOffset_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeTile_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.FeTurbulence_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Filter_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.ForeignObject_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.G_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Image_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Line_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.LinearGradient_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Marker_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Mask_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Path_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Pattern_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Polygon_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Polyline_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.RadialGradient_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Rect_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Svg_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Switch_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Symbol_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Text_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.TextPath_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Tspan_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr Tags.Use_ Transform String where
  pureAttr Transform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform", value }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: prop' value }

instance Attr everything Transform Unit where
  pureAttr Transform _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transform", value: unset' }
  mapAttr Transform evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transform", value: unset' }
