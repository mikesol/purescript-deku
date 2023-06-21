module Deku.DOM.Attr.SystemLanguage where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data SystemLanguage = SystemLanguage

instance Attr Tags.AnimateTransform_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Circle_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.ClipPath_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Discard_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Ellipse_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.ForeignObject_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.G_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Image_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Line_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Marker_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Mask_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Path_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Pattern_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Polygon_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Polyline_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Rect_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Svg_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Switch_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Text_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.TextPath_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Tspan_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr Tags.Use_ SystemLanguage String where
  pureAttr SystemLanguage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "systemLanguage", value }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: prop' value }

instance Attr everything SystemLanguage Unit where
  pureAttr SystemLanguage _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "systemLanguage", value: unset' }
  mapAttr SystemLanguage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "systemLanguage", value: unset' }
