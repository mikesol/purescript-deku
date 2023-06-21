module Deku.DOM.Attr.StopOpacity where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data StopOpacity = StopOpacity

instance Attr Tags.FeBlend_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeColorMatrix_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeComponentTransfer_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeComposite_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeDisplacementMap_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeFlood_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeGaussianBlur_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeImage_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeMerge_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeMorphology_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeOffset_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeSpecularLighting_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeTile_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.FeTurbulence_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.Filter_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.Image_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.Stop_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr Tags.Switch_ StopOpacity String where
  pureAttr StopOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stop-opacity", value }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: prop' value }

instance Attr everything StopOpacity Unit where
  pureAttr StopOpacity _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "stop-opacity", value: unset' }
  mapAttr StopOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stop-opacity", value: unset' }
