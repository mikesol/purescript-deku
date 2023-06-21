module Deku.DOM.Attr.Clip where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Clip = Clip

instance Attr Tags.FeBlend_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeColorMatrix_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeComposite_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeFlood_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeImage_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeMerge_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeMorphology_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeOffset_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeTile_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.FeTurbulence_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.Filter_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.Image_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr Tags.Switch_ Clip String where
  pureAttr Clip value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "clip", value }

  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "clip", value: prop' value }

instance Attr everything Clip Unit where
  pureAttr Clip _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "clip", value: unset' }
  mapAttr Clip evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "clip", value: unset' }
