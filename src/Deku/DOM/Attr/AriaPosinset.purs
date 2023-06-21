module Deku.DOM.Attr.AriaPosinset where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaPosinset = AriaPosinset

instance Attr Tags.Circle_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.Ellipse_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.ForeignObject_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.G_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.Line_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.Marker_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.Path_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.Polygon_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.Polyline_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.Rect_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.Svg_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.Symbol_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.Text_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.TextPath_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.Tspan_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.Use_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr Tags.View_ AriaPosinset String where
  pureAttr AriaPosinset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-posinset", value }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: prop' value }

instance Attr everything AriaPosinset Unit where
  pureAttr AriaPosinset _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-posinset", value: unset' }
  mapAttr AriaPosinset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-posinset", value: unset' }
