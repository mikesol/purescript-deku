module Deku.DOM.Attr.FontStretch where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FontStretch = FontStretch

instance Attr Tags.FeBlend_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeColorMatrix_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeComponentTransfer_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeComposite_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeDisplacementMap_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeFlood_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeGaussianBlur_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeImage_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeMerge_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeMorphology_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeOffset_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeSpecularLighting_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeTile_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.FeTurbulence_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.Filter_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.Image_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.Switch_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.Text_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr Tags.Tspan_ FontStretch String where
  pureAttr FontStretch value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-stretch", value }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: prop' value }

instance Attr everything FontStretch Unit where
  pureAttr FontStretch _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "font-stretch", value: unset' }
  mapAttr FontStretch evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-stretch", value: unset' }
