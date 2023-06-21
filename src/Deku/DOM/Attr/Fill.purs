module Deku.DOM.Attr.Fill where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Fill = Fill

instance Attr Tags.Animate_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.AnimateMotion_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.AnimateTransform_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Circle_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.ClipPath_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Defs_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Ellipse_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeBlend_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeColorMatrix_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeComposite_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeFlood_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeImage_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeMerge_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeMorphology_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeOffset_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeTile_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.FeTurbulence_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Filter_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.ForeignObject_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.G_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Image_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Line_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.LinearGradient_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Marker_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Mask_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Path_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Pattern_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Polygon_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Polyline_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.RadialGradient_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Rect_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Set_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Svg_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Switch_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Symbol_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Text_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.TextPath_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Tspan_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr Tags.Use_ Fill String where
  pureAttr Fill value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill", value }

  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill", value: prop' value }

instance Attr everything Fill Unit where
  pureAttr Fill _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "fill", value: unset' }
  mapAttr Fill evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill", value: unset' }
