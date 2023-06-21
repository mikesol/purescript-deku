module Deku.DOM.Attr.ImageRendering where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ImageRendering = ImageRendering

instance Attr Tags.FeBlend_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeColorMatrix_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeComponentTransfer_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeComposite_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeDisplacementMap_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeFlood_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeGaussianBlur_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeImage_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeMerge_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeMorphology_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeOffset_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeSpecularLighting_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeTile_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.FeTurbulence_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.Filter_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.Image_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr Tags.Switch_ ImageRendering String where
  pureAttr ImageRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "image-rendering", value }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: prop' value }

instance Attr everything ImageRendering Unit where
  pureAttr ImageRendering _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "image-rendering", value: unset' }
  mapAttr ImageRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "image-rendering", value: unset' }
