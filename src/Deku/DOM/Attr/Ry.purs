module Deku.DOM.Attr.Ry where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Ry = Ry

instance Attr Tags.Ellipse_ Ry String where
  pureAttr Ry value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "ry", value }

  mapAttr Ry evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "ry", value: prop' value }

instance Attr Tags.Rect_ Ry String where
  pureAttr Ry value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "ry", value }

  mapAttr Ry evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "ry", value: prop' value }

instance Attr everything Ry Unit where
  pureAttr Ry _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "ry", value: unset' }
  mapAttr Ry evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "ry", value: unset' }
