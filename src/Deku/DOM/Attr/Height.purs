module Deku.DOM.Attr.Height where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Height = Height

instance Attr Tags.Canvas_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Embed_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Iframe_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Img_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Input_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Object_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Video_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeBlend_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeColorMatrix_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeComposite_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeDropShadow_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeFlood_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeImage_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeMerge_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeMorphology_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeOffset_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeTile_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.FeTurbulence_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Filter_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.ForeignObject_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Image_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Mask_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Pattern_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Rect_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Svg_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Symbol_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr Tags.Use_ Height String where
  pureAttr Height value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "height", value }

  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "height", value: prop' value }

instance Attr everything Height Unit where
  pureAttr Height _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "height", value: unset' }
  mapAttr Height evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "height", value: unset' }
