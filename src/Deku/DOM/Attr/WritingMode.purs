module Deku.DOM.Attr.WritingMode where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data WritingMode = WritingMode

instance Attr Tags.FeBlend_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeColorMatrix_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeComponentTransfer_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeComposite_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeDisplacementMap_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeFlood_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeGaussianBlur_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeImage_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeMerge_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeMorphology_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeOffset_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeSpecularLighting_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeTile_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.FeTurbulence_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.Filter_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.Image_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr Tags.Switch_ WritingMode String where
  pureAttr WritingMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "writing-mode", value }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: prop' value }

instance Attr everything WritingMode Unit where
  pureAttr WritingMode _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "writing-mode", value: unset' }
  mapAttr WritingMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "writing-mode", value: unset' }
