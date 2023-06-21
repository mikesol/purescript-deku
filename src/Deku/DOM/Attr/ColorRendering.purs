module Deku.DOM.Attr.ColorRendering where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ColorRendering = ColorRendering

instance Attr Tags.Circle_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Defs_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Ellipse_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeBlend_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeColorMatrix_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeComponentTransfer_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeComposite_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeDisplacementMap_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeFlood_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeGaussianBlur_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeImage_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeMerge_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeMorphology_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeOffset_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeSpecularLighting_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeTile_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.FeTurbulence_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Filter_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.ForeignObject_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.G_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Image_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Line_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.LinearGradient_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Marker_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Path_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Pattern_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Polygon_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Polyline_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.RadialGradient_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Rect_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Svg_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Switch_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Symbol_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Text_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.TextPath_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Tspan_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr Tags.Use_ ColorRendering String where
  pureAttr ColorRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-rendering", value }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: prop' value }

instance Attr everything ColorRendering Unit where
  pureAttr ColorRendering _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "color-rendering", value: unset' }
  mapAttr ColorRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-rendering", value: unset' }
