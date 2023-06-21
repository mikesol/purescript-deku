module Deku.DOM.Attr.AriaPlaceholder where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaPlaceholder = AriaPlaceholder

instance Attr Tags.Circle_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.Ellipse_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.ForeignObject_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.G_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.Line_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.Marker_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.Path_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.Polygon_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.Polyline_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.Rect_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.Svg_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.Symbol_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.Text_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.TextPath_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.Tspan_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.Use_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr Tags.View_ AriaPlaceholder String where
  pureAttr AriaPlaceholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-placeholder", value }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-placeholder", value: prop' value }

instance Attr everything AriaPlaceholder Unit where
  pureAttr AriaPlaceholder _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-placeholder", value: unset' }
  mapAttr AriaPlaceholder evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-placeholder", value: unset' }
