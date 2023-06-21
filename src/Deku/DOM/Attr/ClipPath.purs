module Deku.DOM.Attr.ClipPath where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ClipPath = ClipPath

instance Attr Tags.Circle_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.ClipPath_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Defs_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Ellipse_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeBlend_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeColorMatrix_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeComponentTransfer_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeComposite_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeDisplacementMap_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeFlood_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeGaussianBlur_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeImage_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeMerge_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeMorphology_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeOffset_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeSpecularLighting_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeTile_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.FeTurbulence_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Filter_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.ForeignObject_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.G_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Image_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Line_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.LinearGradient_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Marker_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Mask_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Path_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Pattern_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Polygon_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Polyline_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.RadialGradient_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Rect_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Svg_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Switch_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Symbol_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Text_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.TextPath_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Tspan_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr Tags.Use_ ClipPath String where
  pureAttr ClipPath value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-path", value }

  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-path", value: prop' value }

instance Attr everything ClipPath Unit where
  pureAttr ClipPath _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "clip-path", value: unset' }
  mapAttr ClipPath evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "clip-path", value: unset' }
