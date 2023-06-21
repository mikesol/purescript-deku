module Deku.DOM.Attr.FontFamily where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FontFamily = FontFamily

instance Attr Tags.FeBlend_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeColorMatrix_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeComponentTransfer_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeComposite_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeDisplacementMap_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeFlood_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeGaussianBlur_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeImage_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeMerge_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeMorphology_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeOffset_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeSpecularLighting_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeTile_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.FeTurbulence_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.Filter_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.Image_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.Switch_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.Text_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr Tags.Tspan_ FontFamily String where
  pureAttr FontFamily value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-family", value }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: prop' value }

instance Attr everything FontFamily Unit where
  pureAttr FontFamily _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "font-family", value: unset' }
  mapAttr FontFamily evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-family", value: unset' }
