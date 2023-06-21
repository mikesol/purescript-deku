module Deku.DOM.Attr.FillOpacity where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FillOpacity = FillOpacity

instance Attr Tags.Circle_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.ClipPath_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Defs_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Ellipse_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeBlend_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeColorMatrix_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeComponentTransfer_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeComposite_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeDisplacementMap_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeFlood_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeGaussianBlur_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeImage_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeMerge_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeMorphology_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeOffset_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeSpecularLighting_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeTile_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.FeTurbulence_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Filter_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.ForeignObject_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.G_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Image_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Line_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.LinearGradient_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Marker_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Mask_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Path_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Pattern_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Polygon_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Polyline_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.RadialGradient_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Rect_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Svg_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Switch_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Symbol_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Text_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.TextPath_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Tspan_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr Tags.Use_ FillOpacity String where
  pureAttr FillOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fill-opacity", value }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: prop' value }

instance Attr everything FillOpacity Unit where
  pureAttr FillOpacity _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "fill-opacity", value: unset' }
  mapAttr FillOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fill-opacity", value: unset' }
