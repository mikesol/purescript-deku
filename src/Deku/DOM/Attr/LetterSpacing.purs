module Deku.DOM.Attr.LetterSpacing where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data LetterSpacing = LetterSpacing

instance Attr Tags.FeBlend_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeColorMatrix_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeComponentTransfer_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeComposite_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeDisplacementMap_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeFlood_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeGaussianBlur_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeImage_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeMerge_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeMorphology_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeOffset_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeSpecularLighting_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeTile_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.FeTurbulence_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.Filter_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.Image_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr Tags.Switch_ LetterSpacing String where
  pureAttr LetterSpacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "letter-spacing", value }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: prop' value }

instance Attr everything LetterSpacing Unit where
  pureAttr LetterSpacing _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "letter-spacing", value: unset' }
  mapAttr LetterSpacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "letter-spacing", value: unset' }
