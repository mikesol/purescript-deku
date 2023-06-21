module Deku.DOM.Attr.AriaActivedescendant where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaActivedescendant = AriaActivedescendant

instance Attr Tags.Circle_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.Ellipse_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.ForeignObject_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.G_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.Line_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.Marker_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.Path_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.Polygon_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.Polyline_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.Rect_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.Svg_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.Symbol_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.Text_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.TextPath_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.Tspan_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.Use_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tags.View_ AriaActivedescendant String where
  pureAttr AriaActivedescendant value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-activedescendant", value }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: prop' value }

instance Attr everything AriaActivedescendant Unit where
  pureAttr AriaActivedescendant _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-activedescendant", value: unset' }
  mapAttr AriaActivedescendant evalue = unsafeAttribute $ Right $ evalue <#>
    \_ -> unsafeVolatileAttribute
      { key: "aria-activedescendant", value: unset' }
