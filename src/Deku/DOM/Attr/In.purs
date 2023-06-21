module Deku.DOM.Attr.In where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data In = In

instance Attr Tags.FeBlend_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeColorMatrix_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeComponentTransfer_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeComposite_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeDisplacementMap_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeDropShadow_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeGaussianBlur_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeMergeNode_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeMorphology_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeOffset_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeSpecularLighting_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr Tags.FeTile_ In String where
  pureAttr In value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in", value }

  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in", value: prop' value }

instance Attr everything In Unit where
  pureAttr In _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "in", value: unset' }
  mapAttr In evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "in", value: unset' }
