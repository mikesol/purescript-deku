module Deku.DOM.Attr.PathLength where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data PathLength = PathLength

instance Attr Tags.Circle_ PathLength String where
  pureAttr PathLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pathLength", value }
  mapAttr PathLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pathLength", value: prop' value }

instance Attr Tags.Ellipse_ PathLength String where
  pureAttr PathLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pathLength", value }
  mapAttr PathLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pathLength", value: prop' value }

instance Attr Tags.Line_ PathLength String where
  pureAttr PathLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pathLength", value }
  mapAttr PathLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pathLength", value: prop' value }

instance Attr Tags.Path_ PathLength String where
  pureAttr PathLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pathLength", value }
  mapAttr PathLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pathLength", value: prop' value }

instance Attr Tags.Polygon_ PathLength String where
  pureAttr PathLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pathLength", value }
  mapAttr PathLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pathLength", value: prop' value }

instance Attr Tags.Polyline_ PathLength String where
  pureAttr PathLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pathLength", value }
  mapAttr PathLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pathLength", value: prop' value }

instance Attr Tags.Rect_ PathLength String where
  pureAttr PathLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pathLength", value }
  mapAttr PathLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pathLength", value: prop' value }

instance Attr everything PathLength Unit where
  pureAttr PathLength _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pathLength", value: unset' }
  mapAttr PathLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pathLength", value: unset' }
