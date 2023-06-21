module Deku.DOM.Attr.XmlLang where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data XmlLang = XmlLang

instance Attr Tags.AnimateTransform_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.Discard_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeBlend_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeColorMatrix_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeComponentTransfer_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeComposite_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeDisplacementMap_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeDistantLight_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeFlood_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeFuncA_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeFuncB_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeFuncG_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeFuncR_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeGaussianBlur_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeImage_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeMerge_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeMergeNode_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeMorphology_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeOffset_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FePointLight_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeSpecularLighting_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeSpotLight_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeTile_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.FeTurbulence_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.Filter_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.Image_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.Metadata_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.Mpath_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.Switch_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr Tags.View_ XmlLang String where
  pureAttr XmlLang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:lang", value }

  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:lang", value: prop' value }

instance Attr everything XmlLang Unit where
  pureAttr XmlLang _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "xml:lang", value: unset' }
  mapAttr XmlLang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xml:lang", value: unset' }
