module Deku.DOM.Attr.AriaMultiselectable where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaMultiselectable = AriaMultiselectable

instance Attr Tags.Circle_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.Ellipse_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.ForeignObject_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.G_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.Line_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.Marker_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.Path_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.Polygon_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.Polyline_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.Rect_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.Svg_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.Symbol_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.Text_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.TextPath_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.Tspan_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.Use_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr Tags.View_ AriaMultiselectable String where
  pureAttr AriaMultiselectable value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-multiselectable", value }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: prop' value }

instance Attr everything AriaMultiselectable Unit where
  pureAttr AriaMultiselectable _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-multiselectable", value: unset' }
  mapAttr AriaMultiselectable evalue = unsafeAttribute $ Right $ evalue <#>
    \_ -> unsafeVolatileAttribute
      { key: "aria-multiselectable", value: unset' }
