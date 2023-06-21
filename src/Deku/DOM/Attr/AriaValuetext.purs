module Deku.DOM.Attr.AriaValuetext where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaValuetext = AriaValuetext

instance Attr Tags.Circle_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.Ellipse_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.ForeignObject_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.G_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.Line_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.Marker_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.Path_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.Polygon_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.Polyline_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.Rect_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.Svg_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.Symbol_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.Text_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.TextPath_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.Tspan_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.Use_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr Tags.View_ AriaValuetext String where
  pureAttr AriaValuetext value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-valuetext", value }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: prop' value }

instance Attr everything AriaValuetext Unit where
  pureAttr AriaValuetext _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: unset' }
  mapAttr AriaValuetext evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-valuetext", value: unset' }
