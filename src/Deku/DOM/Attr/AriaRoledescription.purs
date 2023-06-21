module Deku.DOM.Attr.AriaRoledescription where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaRoledescription = AriaRoledescription

instance Attr Tags.Circle_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.Ellipse_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.ForeignObject_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.G_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.Line_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.Marker_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.Path_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.Polygon_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.Polyline_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.Rect_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.Svg_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.Symbol_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.Text_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.TextPath_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.Tspan_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.Use_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr Tags.View_ AriaRoledescription String where
  pureAttr AriaRoledescription value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "aria-roledescription", value }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: prop' value }

instance Attr everything AriaRoledescription Unit where
  pureAttr AriaRoledescription _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-roledescription", value: unset' }
  mapAttr AriaRoledescription evalue = unsafeAttribute $ Right $ evalue <#>
    \_ -> unsafeVolatileAttribute
      { key: "aria-roledescription", value: unset' }
