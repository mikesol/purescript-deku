module Deku.DOM.Attr.Filter where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Filter = Filter

instance Attr Tags.Circle_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.ClipPath_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Defs_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Ellipse_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeBlend_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeColorMatrix_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeComposite_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeFlood_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeImage_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeMerge_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeMorphology_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeOffset_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeTile_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.FeTurbulence_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Filter_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.ForeignObject_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.G_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Image_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Line_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.LinearGradient_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Marker_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Mask_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Path_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Pattern_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Polygon_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Polyline_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.RadialGradient_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Rect_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Svg_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Switch_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Symbol_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Text_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.TextPath_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Tspan_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr Tags.Use_ Filter String where
  pureAttr Filter value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filter", value }

  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "filter", value: prop' value }

instance Attr everything Filter Unit where
  pureAttr Filter _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "filter", value: unset' }
  mapAttr Filter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "filter", value: unset' }
