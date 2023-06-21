module Deku.DOM.Attr.TextDecoration where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data TextDecoration = TextDecoration

instance Attr Tags.FeBlend_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeColorMatrix_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeComponentTransfer_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeComposite_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeDisplacementMap_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeFlood_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeGaussianBlur_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeImage_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeMerge_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeMorphology_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeOffset_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeSpecularLighting_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeTile_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.FeTurbulence_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.Filter_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.Image_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr Tags.Switch_ TextDecoration String where
  pureAttr TextDecoration value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-decoration", value }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: prop' value }

instance Attr everything TextDecoration Unit where
  pureAttr TextDecoration _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "text-decoration", value: unset' }
  mapAttr TextDecoration evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-decoration", value: unset' }
