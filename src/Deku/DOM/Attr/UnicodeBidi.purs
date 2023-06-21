module Deku.DOM.Attr.UnicodeBidi where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data UnicodeBidi = UnicodeBidi

instance Attr Tags.FeBlend_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeColorMatrix_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeComponentTransfer_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeComposite_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeDisplacementMap_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeFlood_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeGaussianBlur_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeImage_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeMerge_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeMorphology_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeOffset_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeSpecularLighting_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeTile_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.FeTurbulence_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.Filter_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.Image_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr Tags.Switch_ UnicodeBidi String where
  pureAttr UnicodeBidi value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "unicode-bidi", value }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: prop' value }

instance Attr everything UnicodeBidi Unit where
  pureAttr UnicodeBidi _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: unset' }
  mapAttr UnicodeBidi evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "unicode-bidi", value: unset' }
