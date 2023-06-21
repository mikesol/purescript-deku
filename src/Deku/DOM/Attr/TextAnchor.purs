module Deku.DOM.Attr.TextAnchor where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data TextAnchor = TextAnchor

instance Attr Tags.FeBlend_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeColorMatrix_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeComponentTransfer_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeComposite_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeDisplacementMap_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeFlood_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeGaussianBlur_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeImage_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeMerge_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeMorphology_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeOffset_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeSpecularLighting_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeTile_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.FeTurbulence_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.Filter_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.Image_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.Switch_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.Text_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr Tags.Tspan_ TextAnchor String where
  pureAttr TextAnchor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-anchor", value }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: prop' value }

instance Attr everything TextAnchor Unit where
  pureAttr TextAnchor _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "text-anchor", value: unset' }
  mapAttr TextAnchor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-anchor", value: unset' }
