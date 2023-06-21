module Deku.DOM.Attr.AriaFlowto where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AriaFlowto = AriaFlowto

instance Attr Tags.Circle_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.Ellipse_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.ForeignObject_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.G_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.Line_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.Marker_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.Path_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.Polygon_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.Polyline_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.Rect_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.Svg_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.Symbol_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.Text_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.TextPath_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.Tspan_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.Use_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr Tags.View_ AriaFlowto String where
  pureAttr AriaFlowto value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "aria-flowto", value }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: prop' value }

instance Attr everything AriaFlowto Unit where
  pureAttr AriaFlowto _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "aria-flowto", value: unset' }
  mapAttr AriaFlowto evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "aria-flowto", value: unset' }
