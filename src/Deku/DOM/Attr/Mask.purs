module Deku.DOM.Attr.Mask where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Mask = Mask

instance Attr Tags.Circle_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.ClipPath_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Defs_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Ellipse_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeBlend_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeColorMatrix_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeComposite_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeFlood_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeImage_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeMerge_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeMorphology_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeOffset_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeTile_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.FeTurbulence_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Filter_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.ForeignObject_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.G_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Image_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Line_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.LinearGradient_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Marker_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Mask_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Path_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Pattern_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Polygon_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Polyline_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.RadialGradient_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Rect_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Svg_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Switch_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Symbol_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Text_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.TextPath_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Tspan_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr Tags.Use_ Mask String where
  pureAttr Mask value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "mask", value }

  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "mask", value: prop' value }

instance Attr everything Mask Unit where
  pureAttr Mask _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "mask", value: unset' }
  mapAttr Mask evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mask", value: unset' }
