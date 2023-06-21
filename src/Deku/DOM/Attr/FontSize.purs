module Deku.DOM.Attr.FontSize where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FontSize = FontSize

instance Attr Tags.FeBlend_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeColorMatrix_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeComponentTransfer_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeComposite_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeDisplacementMap_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeFlood_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeGaussianBlur_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeImage_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeMerge_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeMorphology_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeOffset_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeSpecularLighting_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeTile_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.FeTurbulence_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.Filter_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.Image_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.Switch_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.Text_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr Tags.Tspan_ FontSize String where
  pureAttr FontSize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size", value }

  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "font-size", value: prop' value }

instance Attr everything FontSize Unit where
  pureAttr FontSize _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "font-size", value: unset' }
  mapAttr FontSize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size", value: unset' }
