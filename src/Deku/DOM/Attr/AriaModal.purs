module Deku.DOM.Attr.AriaModal where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaModal = AriaModal

instance Attr Tags.Circle_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.Ellipse_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.ForeignObject_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.G_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.Line_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.Marker_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.Path_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.Polygon_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.Polyline_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.Rect_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.Svg_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.Symbol_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.Text_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.TextPath_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.Tspan_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.Use_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr Tags.View_ AriaModal String where
  pureAttr AriaModal value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-modal", value }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: prop' value }

instance Attr everything AriaModal Unit where
  pureAttr AriaModal _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-modal", value: unset' }
  mapAttr AriaModal evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-modal", value: unset' }
