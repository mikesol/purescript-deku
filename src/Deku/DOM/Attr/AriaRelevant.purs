module Deku.DOM.Attr.AriaRelevant where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaRelevant = AriaRelevant

instance Attr Tags.Circle_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.Ellipse_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.ForeignObject_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.G_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.Line_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.Marker_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.Path_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.Polygon_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.Polyline_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.Rect_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.Svg_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.Symbol_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.Text_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.TextPath_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.Tspan_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.Use_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr Tags.View_ AriaRelevant String where
  pureAttr AriaRelevant value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-relevant", value }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: prop' value }

instance Attr everything AriaRelevant Unit where
  pureAttr AriaRelevant _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-relevant", value: unset' }
  mapAttr AriaRelevant evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-relevant", value: unset' }
