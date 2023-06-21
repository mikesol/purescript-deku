module Deku.DOM.Attr.ColorProfile where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ColorProfile = ColorProfile

instance Attr Tags.FeBlend_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeColorMatrix_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeComponentTransfer_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeComposite_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeDisplacementMap_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeFlood_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeGaussianBlur_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeImage_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeMerge_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeMorphology_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeOffset_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeSpecularLighting_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeTile_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.FeTurbulence_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.Filter_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.Image_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr Tags.Switch_ ColorProfile String where
  pureAttr ColorProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "color-profile", value }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: prop' value }

instance Attr everything ColorProfile Unit where
  pureAttr ColorProfile _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "color-profile", value: unset' }
  mapAttr ColorProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "color-profile", value: unset' }
