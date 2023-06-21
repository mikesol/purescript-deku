module Deku.DOM.Attr.AriaInvalid where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaInvalid = AriaInvalid

instance Attr Tags.Circle_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.Ellipse_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.ForeignObject_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.G_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.Line_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.Marker_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.Path_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.Polygon_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.Polyline_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.Rect_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.Svg_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.Symbol_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.Text_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.TextPath_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.Tspan_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.Use_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr Tags.View_ AriaInvalid String where
  pureAttr AriaInvalid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-invalid", value }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: prop' value }

instance Attr everything AriaInvalid Unit where
  pureAttr AriaInvalid _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-invalid", value: unset' }
  mapAttr AriaInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-invalid", value: unset' }
