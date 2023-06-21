module Deku.DOM.Attr.Cursor where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Cursor = Cursor

instance Attr Tags.Circle_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Defs_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Ellipse_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeBlend_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeColorMatrix_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeComposite_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeFlood_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeImage_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeMerge_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeMorphology_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeOffset_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeTile_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.FeTurbulence_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Filter_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.ForeignObject_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.G_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Image_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Line_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.LinearGradient_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Marker_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Path_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Pattern_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Polygon_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Polyline_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.RadialGradient_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Rect_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Svg_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Switch_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Symbol_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Text_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.TextPath_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Tspan_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr Tags.Use_ Cursor String where
  pureAttr Cursor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cursor", value }

  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cursor", value: prop' value }

instance Attr everything Cursor Unit where
  pureAttr Cursor _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "cursor", value: unset' }
  mapAttr Cursor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "cursor", value: unset' }
