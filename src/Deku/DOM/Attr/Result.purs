module Deku.DOM.Attr.Result where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Result = Result

instance Attr Tags.FeBlend_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeColorMatrix_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeComposite_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeDropShadow_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeFlood_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeImage_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeMerge_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeMorphology_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeOffset_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeTile_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr Tags.FeTurbulence_ Result String where
  pureAttr Result value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "result", value }

  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "result", value: prop' value }

instance Attr everything Result Unit where
  pureAttr Result _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "result", value: unset' }
  mapAttr Result evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "result", value: unset' }
