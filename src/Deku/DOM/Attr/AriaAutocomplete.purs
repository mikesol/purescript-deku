module Deku.DOM.Attr.AriaAutocomplete where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaAutocomplete = AriaAutocomplete

instance Attr Tags.Circle_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.Ellipse_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.ForeignObject_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.G_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.Line_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.Marker_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.Path_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.Polygon_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.Polyline_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.Rect_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.Svg_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.Symbol_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.Text_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.TextPath_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.Tspan_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.Use_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr Tags.View_ AriaAutocomplete String where
  pureAttr AriaAutocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-autocomplete", value }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "aria-autocomplete", value: prop' value }

instance Attr everything AriaAutocomplete Unit where
  pureAttr AriaAutocomplete _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-autocomplete", value: unset' }
  mapAttr AriaAutocomplete evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-autocomplete", value: unset' }
