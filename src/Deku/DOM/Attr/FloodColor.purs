module Deku.DOM.Attr.FloodColor where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FloodColor = FloodColor

instance Attr Tags.FeBlend_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeColorMatrix_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeComponentTransfer_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeComposite_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeDisplacementMap_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeDropShadow_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeFlood_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeGaussianBlur_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeImage_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeMerge_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeMorphology_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeOffset_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeSpecularLighting_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeTile_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.FeTurbulence_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.Filter_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.Image_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr Tags.Switch_ FloodColor String where
  pureAttr FloodColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-color", value }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: prop' value }

instance Attr everything FloodColor Unit where
  pureAttr FloodColor _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "flood-color", value: unset' }
  mapAttr FloodColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-color", value: unset' }
