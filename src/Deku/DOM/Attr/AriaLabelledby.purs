module Deku.DOM.Attr.AriaLabelledby where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaLabelledby = AriaLabelledby

instance Attr Tags.Circle_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.Ellipse_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.ForeignObject_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.G_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.Line_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.Marker_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.Path_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.Polygon_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.Polyline_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.Rect_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.Svg_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.Symbol_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.Text_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.TextPath_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.Tspan_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.Use_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr Tags.View_ AriaLabelledby String where
  pureAttr AriaLabelledby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-labelledby", value }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: prop' value }

instance Attr everything AriaLabelledby Unit where
  pureAttr AriaLabelledby _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: unset' }
  mapAttr AriaLabelledby evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-labelledby", value: unset' }
