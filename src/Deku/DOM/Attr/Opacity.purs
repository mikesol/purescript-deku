module Deku.DOM.Attr.Opacity where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Opacity = Opacity

instance Attr Tags.Circle_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.ClipPath_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Defs_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Ellipse_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeBlend_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeColorMatrix_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeComposite_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeFlood_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeImage_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeMerge_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeMorphology_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeOffset_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeTile_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.FeTurbulence_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Filter_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.ForeignObject_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.G_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Image_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Line_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.LinearGradient_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Marker_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Mask_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Path_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Pattern_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Polygon_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Polyline_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.RadialGradient_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Rect_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Svg_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Switch_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Symbol_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Text_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.TextPath_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Tspan_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr Tags.Use_ Opacity String where
  pureAttr Opacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "opacity", value }

  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "opacity", value: prop' value }

instance Attr everything Opacity Unit where
  pureAttr Opacity _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "opacity", value: unset' }
  mapAttr Opacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "opacity", value: unset' }
