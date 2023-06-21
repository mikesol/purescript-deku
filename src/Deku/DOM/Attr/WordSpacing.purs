module Deku.DOM.Attr.WordSpacing where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data WordSpacing = WordSpacing

instance Attr Tags.FeBlend_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeColorMatrix_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeComponentTransfer_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeComposite_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeDisplacementMap_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeFlood_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeGaussianBlur_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeImage_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeMerge_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeMorphology_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeOffset_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeSpecularLighting_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeTile_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.FeTurbulence_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.Filter_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.Image_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr Tags.Switch_ WordSpacing String where
  pureAttr WordSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "word-spacing", value }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: prop' value }

instance Attr everything WordSpacing Unit where
  pureAttr WordSpacing _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "word-spacing", value: unset' }
  mapAttr WordSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "word-spacing", value: unset' }
