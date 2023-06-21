module Deku.DOM.Attr.AriaRowcount where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaRowcount = AriaRowcount

instance Attr Tags.Circle_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.Ellipse_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.ForeignObject_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.G_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.Line_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.Marker_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.Path_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.Polygon_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.Polyline_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.Rect_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.Svg_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.Symbol_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.Text_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.TextPath_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.Tspan_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.Use_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr Tags.View_ AriaRowcount String where
  pureAttr AriaRowcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-rowcount", value }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: prop' value }

instance Attr everything AriaRowcount Unit where
  pureAttr AriaRowcount _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: unset' }
  mapAttr AriaRowcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-rowcount", value: unset' }
