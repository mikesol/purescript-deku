module Deku.DOM.Attr.Direction where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Direction = Direction

instance Attr Tags.FeBlend_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeColorMatrix_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeComposite_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeFlood_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeImage_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeMerge_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeMorphology_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeOffset_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeTile_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.FeTurbulence_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.Filter_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.Image_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr Tags.Switch_ Direction String where
  pureAttr Direction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "direction", value }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: prop' value }

instance Attr everything Direction Unit where
  pureAttr Direction _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "direction", value: unset' }
  mapAttr Direction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "direction", value: unset' }
