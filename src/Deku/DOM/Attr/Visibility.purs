module Deku.DOM.Attr.Visibility where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Visibility = Visibility

instance Attr Tags.Circle_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.ClipPath_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Defs_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Ellipse_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeBlend_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeColorMatrix_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeComposite_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeFlood_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeImage_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeMerge_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeMorphology_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeOffset_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeTile_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.FeTurbulence_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Filter_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.ForeignObject_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.G_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Image_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Line_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.LinearGradient_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Marker_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Mask_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Path_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Pattern_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Polygon_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Polyline_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.RadialGradient_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Rect_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Stop_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Svg_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Switch_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Symbol_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Text_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.TextPath_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Tspan_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr Tags.Use_ Visibility String where
  pureAttr Visibility value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "visibility", value }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: prop' value }

instance Attr everything Visibility Unit where
  pureAttr Visibility _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "visibility", value: unset' }
  mapAttr Visibility evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "visibility", value: unset' }
