module Deku.DOM.Attr.StopColor where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data StopColor = StopColor

instance Attr Tags.FeBlend_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeColorMatrix_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeComponentTransfer_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeComposite_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeDisplacementMap_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeFlood_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeGaussianBlur_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeImage_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeMerge_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeMorphology_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeOffset_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeSpecularLighting_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeTile_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.FeTurbulence_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.Filter_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.Image_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.Stop_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr Tags.Switch_ StopColor String where
  pureAttr StopColor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-color", value }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: prop' value }

instance Attr everything StopColor Unit where
  pureAttr StopColor _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "stop-color", value: unset' }
  mapAttr StopColor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-color", value: unset' }
