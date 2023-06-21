module Deku.DOM.Attr.AriaColcount where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaColcount = AriaColcount

instance Attr Tags.Circle_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.Ellipse_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.ForeignObject_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.G_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.Line_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.Marker_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.Path_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.Polygon_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.Polyline_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.Rect_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.Svg_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.Symbol_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.Text_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.TextPath_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.Tspan_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.Use_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr Tags.View_ AriaColcount String where
  pureAttr AriaColcount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-colcount", value }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: prop' value }

instance Attr everything AriaColcount Unit where
  pureAttr AriaColcount _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-colcount", value: unset' }
  mapAttr AriaColcount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-colcount", value: unset' }
