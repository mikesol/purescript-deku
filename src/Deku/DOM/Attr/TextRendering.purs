module Deku.DOM.Attr.TextRendering where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data TextRendering = TextRendering

instance Attr Tags.FeBlend_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeColorMatrix_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeComponentTransfer_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeComposite_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeDisplacementMap_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeFlood_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeGaussianBlur_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeImage_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeMerge_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeMorphology_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeOffset_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeSpecularLighting_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeTile_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.FeTurbulence_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.Filter_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.Image_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr Tags.Switch_ TextRendering String where
  pureAttr TextRendering value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "text-rendering", value }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: prop' value }

instance Attr everything TextRendering Unit where
  pureAttr TextRendering _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "text-rendering", value: unset' }
  mapAttr TextRendering evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "text-rendering", value: unset' }
