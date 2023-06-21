module Deku.DOM.Attr.AriaDescribedby where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaDescribedby = AriaDescribedby

instance Attr Tags.Circle_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.Ellipse_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.ForeignObject_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.G_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.Line_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.Marker_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.Path_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.Polygon_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.Polyline_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.Rect_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.Svg_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.Symbol_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.Text_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.TextPath_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.Tspan_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.Use_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr Tags.View_ AriaDescribedby String where
  pureAttr AriaDescribedby value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-describedby", value }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-describedby", value: prop' value }

instance Attr everything AriaDescribedby Unit where
  pureAttr AriaDescribedby _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-describedby", value: unset' }
  mapAttr AriaDescribedby evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "aria-describedby", value: unset' }
