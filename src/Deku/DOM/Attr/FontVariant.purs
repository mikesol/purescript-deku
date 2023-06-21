module Deku.DOM.Attr.FontVariant where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FontVariant = FontVariant

instance Attr Tags.FeBlend_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeColorMatrix_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeComponentTransfer_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeComposite_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeDisplacementMap_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeFlood_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeGaussianBlur_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeImage_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeMerge_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeMorphology_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeOffset_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeSpecularLighting_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeTile_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.FeTurbulence_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.Filter_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.Image_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.Switch_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.Text_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr Tags.Tspan_ FontVariant String where
  pureAttr FontVariant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-variant", value }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: prop' value }

instance Attr everything FontVariant Unit where
  pureAttr FontVariant _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "font-variant", value: unset' }
  mapAttr FontVariant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-variant", value: unset' }
