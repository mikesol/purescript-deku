module Deku.DOM.Attr.FontSizeAdjust where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FontSizeAdjust = FontSizeAdjust

instance Attr Tags.FeBlend_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeColorMatrix_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeComponentTransfer_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeComposite_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeDisplacementMap_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeFlood_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeGaussianBlur_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeImage_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeMerge_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeMorphology_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeOffset_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeSpecularLighting_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeTile_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.FeTurbulence_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.Filter_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.Image_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.Switch_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.Text_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr Tags.Tspan_ FontSizeAdjust String where
  pureAttr FontSizeAdjust value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "font-size-adjust", value }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: prop' value }

instance Attr everything FontSizeAdjust Unit where
  pureAttr FontSizeAdjust _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: unset' }
  mapAttr FontSizeAdjust evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "font-size-adjust", value: unset' }
