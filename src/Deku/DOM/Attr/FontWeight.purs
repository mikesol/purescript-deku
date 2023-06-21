module Deku.DOM.Attr.FontWeight where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FontWeight = FontWeight

instance Attr Tags.FeBlend_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeColorMatrix_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeComponentTransfer_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeComposite_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeDisplacementMap_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeFlood_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeGaussianBlur_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeImage_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeMerge_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeMorphology_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeOffset_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeSpecularLighting_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeTile_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.FeTurbulence_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.Filter_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.Image_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.Switch_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.Text_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr Tags.Tspan_ FontWeight String where
  pureAttr FontWeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-weight", value }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: prop' value }

instance Attr everything FontWeight Unit where
  pureAttr FontWeight _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "font-weight", value: unset' }
  mapAttr FontWeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-weight", value: unset' }
