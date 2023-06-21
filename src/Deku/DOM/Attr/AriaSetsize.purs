module Deku.DOM.Attr.AriaSetsize where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaSetsize = AriaSetsize

instance Attr Tags.Circle_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.Ellipse_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.ForeignObject_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.G_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.Line_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.Marker_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.Path_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.Polygon_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.Polyline_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.Rect_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.Svg_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.Symbol_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.Text_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.TextPath_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.Tspan_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.Use_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr Tags.View_ AriaSetsize String where
  pureAttr AriaSetsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-setsize", value }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: prop' value }

instance Attr everything AriaSetsize Unit where
  pureAttr AriaSetsize _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-setsize", value: unset' }
  mapAttr AriaSetsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-setsize", value: unset' }
