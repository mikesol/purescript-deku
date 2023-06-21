module Deku.DOM.Attr.AriaOwns where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaOwns = AriaOwns

instance Attr Tags.Circle_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.Ellipse_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.ForeignObject_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.G_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.Line_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.Marker_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.Path_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.Polygon_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.Polyline_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.Rect_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.Svg_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.Symbol_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.Text_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.TextPath_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.Tspan_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.Use_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr Tags.View_ AriaOwns String where
  pureAttr AriaOwns value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-owns", value }

  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "aria-owns", value: prop' value }

instance Attr everything AriaOwns Unit where
  pureAttr AriaOwns _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "aria-owns", value: unset' }
  mapAttr AriaOwns evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-owns", value: unset' }
