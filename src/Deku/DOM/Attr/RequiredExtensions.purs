module Deku.DOM.Attr.RequiredExtensions where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data RequiredExtensions = RequiredExtensions

instance Attr Tags.AnimateTransform_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Circle_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.ClipPath_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Discard_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Ellipse_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.ForeignObject_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.G_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Image_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Line_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Marker_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Mask_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Path_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Pattern_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Polygon_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Polyline_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Rect_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Svg_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Switch_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Text_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.TextPath_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Tspan_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr Tags.Use_ RequiredExtensions String where
  pureAttr RequiredExtensions value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "requiredExtensions", value }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredExtensions", value: prop' value }

instance Attr everything RequiredExtensions Unit where
  pureAttr RequiredExtensions _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "requiredExtensions", value: unset' }
  mapAttr RequiredExtensions evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "requiredExtensions", value: unset' }
