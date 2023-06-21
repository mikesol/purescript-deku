module Deku.DOM.Attr.XmlSpace where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data XmlSpace = XmlSpace

instance Attr Tags.AnimateTransform_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.Discard_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeBlend_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeColorMatrix_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeComponentTransfer_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeComposite_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeDisplacementMap_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeDistantLight_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeFlood_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeFuncA_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeFuncB_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeFuncG_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeFuncR_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeGaussianBlur_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeImage_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeMerge_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeMergeNode_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeMorphology_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeOffset_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FePointLight_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeSpecularLighting_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeSpotLight_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeTile_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.FeTurbulence_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.Filter_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.Image_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.Metadata_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.Mpath_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.Switch_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr Tags.View_ XmlSpace String where
  pureAttr XmlSpace value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xml:space", value }

  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "xml:space", value: prop' value }

instance Attr everything XmlSpace Unit where
  pureAttr XmlSpace _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "xml:space", value: unset' }
  mapAttr XmlSpace evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xml:space", value: unset' }
