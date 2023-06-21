module Deku.DOM.Attr.AriaDetails where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaDetails = AriaDetails

instance Attr Tags.Circle_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.Ellipse_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.ForeignObject_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.G_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.Line_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.Marker_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.Path_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.Polygon_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.Polyline_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.Rect_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.Svg_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.Symbol_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.Text_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.TextPath_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.Tspan_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.Use_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr Tags.View_ AriaDetails String where
  pureAttr AriaDetails value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-details", value }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: prop' value }

instance Attr everything AriaDetails Unit where
  pureAttr AriaDetails _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-details", value: unset' }
  mapAttr AriaDetails evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-details", value: unset' }
