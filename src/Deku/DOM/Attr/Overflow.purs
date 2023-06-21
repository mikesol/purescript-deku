module Deku.DOM.Attr.Overflow where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Overflow = Overflow

instance Attr Tags.FeBlend_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeColorMatrix_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeComposite_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeFlood_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeImage_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeMerge_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeMorphology_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeOffset_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeTile_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.FeTurbulence_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.Filter_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.Image_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr Tags.Switch_ Overflow String where
  pureAttr Overflow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "overflow", value }

  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "overflow", value: prop' value }

instance Attr everything Overflow Unit where
  pureAttr Overflow _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "overflow", value: unset' }
  mapAttr Overflow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "overflow", value: unset' }
