module Deku.DOM.Attr.AriaCurrent where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaCurrent = AriaCurrent

instance Attr Tags.Circle_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.Ellipse_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.ForeignObject_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.G_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.Line_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.Marker_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.Path_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.Polygon_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.Polyline_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.Rect_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.Svg_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.Symbol_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.Text_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.TextPath_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.Tspan_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.Use_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr Tags.View_ AriaCurrent String where
  pureAttr AriaCurrent value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-current", value }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: prop' value }

instance Attr everything AriaCurrent Unit where
  pureAttr AriaCurrent _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-current", value: unset' }
  mapAttr AriaCurrent evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-current", value: unset' }
