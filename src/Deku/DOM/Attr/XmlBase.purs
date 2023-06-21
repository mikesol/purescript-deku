module Deku.DOM.Attr.XmlBase where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data XmlBase = XmlBase

instance Attr Tags.AnimateTransform_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.Discard_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeBlend_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeColorMatrix_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeComponentTransfer_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeComposite_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeDisplacementMap_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeDistantLight_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeFlood_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeFuncA_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeFuncB_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeFuncG_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeFuncR_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeGaussianBlur_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeImage_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeMerge_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeMergeNode_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeMorphology_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeOffset_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FePointLight_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeSpecularLighting_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeSpotLight_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeTile_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.FeTurbulence_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.Filter_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.Image_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.Metadata_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.Mpath_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.Switch_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr Tags.View_ XmlBase String where
  pureAttr XmlBase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:base", value }

  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:base", value: prop' value }

instance Attr everything XmlBase Unit where
  pureAttr XmlBase _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "xml:base", value: unset' }
  mapAttr XmlBase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xml:base", value: unset' }
