module Deku.DOM.Attr.PointerEvents where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data PointerEvents = PointerEvents

instance Attr Tags.Circle_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Defs_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Ellipse_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeBlend_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeColorMatrix_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeComponentTransfer_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeComposite_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeDisplacementMap_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeFlood_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeGaussianBlur_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeImage_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeMerge_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeMorphology_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeOffset_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeSpecularLighting_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeTile_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.FeTurbulence_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Filter_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.ForeignObject_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.G_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Image_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Line_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.LinearGradient_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Marker_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Path_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Pattern_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Polygon_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Polyline_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.RadialGradient_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Rect_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Svg_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Switch_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Symbol_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Text_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.TextPath_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Tspan_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr Tags.Use_ PointerEvents String where
  pureAttr PointerEvents value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointer-events", value }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: prop' value }

instance Attr everything PointerEvents Unit where
  pureAttr PointerEvents _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointer-events", value: unset' }
  mapAttr PointerEvents evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointer-events", value: unset' }
