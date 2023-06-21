module Deku.DOM.Attr.AriaOrientation where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaOrientation = AriaOrientation

instance Attr Tags.Circle_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.Ellipse_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.ForeignObject_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.G_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.Line_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.Marker_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.Path_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.Polygon_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.Polyline_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.Rect_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.Svg_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.Symbol_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.Text_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.TextPath_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.Tspan_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.Use_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr Tags.View_ AriaOrientation String where
  pureAttr AriaOrientation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-orientation", value }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-orientation", value: prop' value }

instance Attr everything AriaOrientation Unit where
  pureAttr AriaOrientation _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-orientation", value: unset' }
  mapAttr AriaOrientation evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-orientation", value: unset' }
