module Deku.DOM.Attr.BaselineShift where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data BaselineShift = BaselineShift

instance Attr Tags.FeBlend_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeColorMatrix_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeComponentTransfer_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeComposite_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeDisplacementMap_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeFlood_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeGaussianBlur_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeImage_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeMerge_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeMorphology_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeOffset_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeSpecularLighting_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeTile_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.FeTurbulence_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.Filter_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.Image_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr Tags.Switch_ BaselineShift String where
  pureAttr BaselineShift value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseline-shift", value }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: prop' value }

instance Attr everything BaselineShift Unit where
  pureAttr BaselineShift _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "baseline-shift", value: unset' }
  mapAttr BaselineShift evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseline-shift", value: unset' }
