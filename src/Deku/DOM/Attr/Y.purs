module Deku.DOM.Attr.Y where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Y = Y

instance Attr Tags.FeBlend_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeColorMatrix_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeComposite_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeDropShadow_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeFlood_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeImage_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeMerge_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeMorphology_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeOffset_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FePointLight_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeSpotLight_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeTile_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.FeTurbulence_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.Filter_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.ForeignObject_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.Image_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.Mask_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.Pattern_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.Rect_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.Svg_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.Symbol_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.Text_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.Tspan_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr Tags.Use_ Y String where
  pureAttr Y value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "y", value }

  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "y", value: prop' value }

instance Attr everything Y Unit where
  pureAttr Y _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "y", value: unset' }
  mapAttr Y evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "y", value: unset' }
