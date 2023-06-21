module Deku.DOM.Attr.LightingColor where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data LightingColor = LightingColor

instance Attr Tags.FeBlend_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeColorMatrix_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeComponentTransfer_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeComposite_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeDisplacementMap_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeFlood_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeGaussianBlur_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeImage_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeMerge_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeMorphology_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeOffset_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeSpecularLighting_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeTile_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.FeTurbulence_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.Filter_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.Image_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr Tags.Switch_ LightingColor String where
  pureAttr LightingColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lighting-color", value }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: prop' value }

instance Attr everything LightingColor Unit where
  pureAttr LightingColor _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "lighting-color", value: unset' }
  mapAttr LightingColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lighting-color", value: unset' }
