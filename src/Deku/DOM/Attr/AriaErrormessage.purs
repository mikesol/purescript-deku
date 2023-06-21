module Deku.DOM.Attr.AriaErrormessage where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaErrormessage = AriaErrormessage

instance Attr Tags.Circle_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.Ellipse_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.ForeignObject_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.G_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.Line_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.Marker_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.Path_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.Polygon_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.Polyline_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.Rect_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.Svg_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.Symbol_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.Text_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.TextPath_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.Tspan_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.Use_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr Tags.View_ AriaErrormessage String where
  pureAttr AriaErrormessage value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-errormessage", value }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-errormessage", value: prop' value }

instance Attr everything AriaErrormessage Unit where
  pureAttr AriaErrormessage _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-errormessage", value: unset' }
  mapAttr AriaErrormessage evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-errormessage", value: unset' }
