module Deku.DOM.Attr.FloodOpacity where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FloodOpacity = FloodOpacity

instance Attr Tags.FeBlend_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeColorMatrix_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeComponentTransfer_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeComposite_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeDisplacementMap_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeDropShadow_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeFlood_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeGaussianBlur_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeImage_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeMerge_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeMorphology_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeOffset_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeSpecularLighting_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeTile_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.FeTurbulence_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.Filter_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.Image_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr Tags.Switch_ FloodOpacity String where
  pureAttr FloodOpacity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "flood-opacity", value }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: prop' value }

instance Attr everything FloodOpacity Unit where
  pureAttr FloodOpacity _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "flood-opacity", value: unset' }
  mapAttr FloodOpacity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "flood-opacity", value: unset' }
