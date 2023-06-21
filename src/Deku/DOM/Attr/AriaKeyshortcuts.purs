module Deku.DOM.Attr.AriaKeyshortcuts where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaKeyshortcuts = AriaKeyshortcuts

instance Attr Tags.Circle_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.Ellipse_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.ForeignObject_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.G_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.Line_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.Marker_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.Path_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.Polygon_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.Polyline_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.Rect_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.Svg_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.Symbol_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.Text_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.TextPath_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.Tspan_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.Use_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tags.View_ AriaKeyshortcuts String where
  pureAttr AriaKeyshortcuts value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-keyshortcuts", value }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: prop' value }

instance Attr everything AriaKeyshortcuts Unit where
  pureAttr AriaKeyshortcuts _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-keyshortcuts", value: unset' }
  mapAttr AriaKeyshortcuts evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "aria-keyshortcuts", value: unset' }
