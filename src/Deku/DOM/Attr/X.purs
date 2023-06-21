module Deku.DOM.Attr.X where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data X = X

instance Attr Tags.FeBlend_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeColorMatrix_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeComponentTransfer_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeComposite_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeDisplacementMap_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeDropShadow_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeFlood_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeGaussianBlur_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeImage_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeMerge_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeMorphology_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeOffset_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FePointLight_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeSpecularLighting_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeSpotLight_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeTile_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.FeTurbulence_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.Filter_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.ForeignObject_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.Image_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.Mask_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.Pattern_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.Rect_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.Svg_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.Symbol_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.Text_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.Tspan_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr Tags.Use_ X String where
  pureAttr X value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "x", value }

  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "x", value: prop' value }

instance Attr everything X Unit where
  pureAttr X _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "x", value: unset' }
  mapAttr X evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "x", value: unset' }
