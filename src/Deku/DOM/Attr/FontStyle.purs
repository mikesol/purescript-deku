module Deku.DOM.Attr.FontStyle where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FontStyle = FontStyle

instance Attr Tags.FeBlend_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeColorMatrix_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeComponentTransfer_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeComposite_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeDisplacementMap_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeFlood_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeGaussianBlur_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeImage_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeMerge_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeMorphology_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeOffset_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeSpecularLighting_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeTile_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.FeTurbulence_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.Filter_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.Image_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.Switch_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.Text_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr Tags.Tspan_ FontStyle String where
  pureAttr FontStyle value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-style", value }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: prop' value }

instance Attr everything FontStyle Unit where
  pureAttr FontStyle _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "font-style", value: unset' }
  mapAttr FontStyle evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-style", value: unset' }
