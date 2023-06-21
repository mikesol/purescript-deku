module Deku.DOM.Attr.ClipRule where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ClipRule = ClipRule

instance Attr Tags.Circle_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.ClipPath_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Defs_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Ellipse_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeBlend_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeColorMatrix_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeComponentTransfer_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeComposite_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeDisplacementMap_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeFlood_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeGaussianBlur_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeImage_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeMerge_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeMorphology_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeOffset_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeSpecularLighting_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeTile_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.FeTurbulence_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Filter_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.ForeignObject_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.G_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Image_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Line_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.LinearGradient_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Marker_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Mask_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Path_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Pattern_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Polygon_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Polyline_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.RadialGradient_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Rect_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Svg_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Switch_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Symbol_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Text_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.TextPath_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Tspan_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr Tags.Use_ ClipRule String where
  pureAttr ClipRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip-rule", value }

  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip-rule", value: prop' value }

instance Attr everything ClipRule Unit where
  pureAttr ClipRule _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "clip-rule", value: unset' }
  mapAttr ClipRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "clip-rule", value: unset' }
