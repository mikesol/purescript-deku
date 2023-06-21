module Deku.DOM.Attr.Kerning where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Kerning = Kerning

instance Attr Tags.FeBlend_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeColorMatrix_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeComposite_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeFlood_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeImage_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeMerge_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeMorphology_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeOffset_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeTile_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.FeTurbulence_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.Filter_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.Image_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr Tags.Switch_ Kerning String where
  pureAttr Kerning value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kerning", value }

  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kerning", value: prop' value }

instance Attr everything Kerning Unit where
  pureAttr Kerning _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "kerning", value: unset' }
  mapAttr Kerning evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "kerning", value: unset' }
