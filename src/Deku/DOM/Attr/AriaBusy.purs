module Deku.DOM.Attr.AriaBusy where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaBusy = AriaBusy

instance Attr Tags.Circle_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.Ellipse_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.ForeignObject_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.G_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.Line_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.Marker_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.Path_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.Polygon_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.Polyline_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.Rect_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.Svg_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.Symbol_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.Text_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.TextPath_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.Tspan_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.Use_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr Tags.View_ AriaBusy String where
  pureAttr AriaBusy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-busy", value }

  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-busy", value: prop' value }

instance Attr everything AriaBusy Unit where
  pureAttr AriaBusy _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "aria-busy", value: unset' }
  mapAttr AriaBusy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-busy", value: unset' }
