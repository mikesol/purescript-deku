module Deku.DOM.Attr.Width where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Width = Width

instance Attr Tags.Canvas_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Embed_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Iframe_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Img_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Input_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Object_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Video_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeBlend_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeColorMatrix_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeComposite_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeDropShadow_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeFlood_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeImage_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeMerge_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeMorphology_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeOffset_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeTile_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.FeTurbulence_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Filter_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.ForeignObject_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Image_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Mask_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Pattern_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Rect_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Svg_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Symbol_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr Tags.Use_ Width String where
  pureAttr Width value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "width", value }

  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "width", value: prop' value }

instance Attr everything Width Unit where
  pureAttr Width _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "width", value: unset' }
  mapAttr Width evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "width", value: unset' }
