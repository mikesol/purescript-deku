module Deku.DOM.Attr.FillRule where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FillRule = FillRule

instance Attr Tags.Circle_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.ClipPath_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Defs_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Ellipse_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeBlend_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeColorMatrix_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeComponentTransfer_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeComposite_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeDisplacementMap_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeFlood_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeGaussianBlur_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeImage_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeMerge_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeMorphology_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeOffset_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeSpecularLighting_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeTile_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.FeTurbulence_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Filter_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.ForeignObject_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.G_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Image_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Line_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.LinearGradient_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Marker_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Mask_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Path_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Pattern_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Polygon_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Polyline_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.RadialGradient_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Rect_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Svg_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Switch_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Symbol_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Text_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.TextPath_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Tspan_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr Tags.Use_ FillRule String where
  pureAttr FillRule value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-rule", value }

  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fill-rule", value: prop' value }

instance Attr everything FillRule Unit where
  pureAttr FillRule _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "fill-rule", value: unset' }
  mapAttr FillRule evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-rule", value: unset' }
