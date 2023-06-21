module Deku.DOM.Attr.Stroke where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Stroke = Stroke

instance Attr Tags.Circle_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.ClipPath_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Defs_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Ellipse_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeBlend_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeColorMatrix_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeComposite_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeFlood_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeImage_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeMerge_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeMorphology_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeOffset_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeTile_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.FeTurbulence_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Filter_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.ForeignObject_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.G_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Image_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Line_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.LinearGradient_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Marker_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Mask_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Path_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Pattern_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Polygon_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Polyline_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.RadialGradient_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Rect_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Svg_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Switch_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Symbol_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Text_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.TextPath_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Tspan_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr Tags.Use_ Stroke String where
  pureAttr Stroke value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stroke", value }

  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stroke", value: prop' value }

instance Attr everything Stroke Unit where
  pureAttr Stroke _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "stroke", value: unset' }
  mapAttr Stroke evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stroke", value: unset' }
