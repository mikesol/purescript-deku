module Deku.DOM.Attr.Rx where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Rx = Rx

instance Attr Tags.Ellipse_ Rx String where
  pureAttr Rx value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "rx", value }

  mapAttr Rx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "rx", value: prop' value }

instance Attr Tags.Rect_ Rx String where
  pureAttr Rx value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "rx", value }

  mapAttr Rx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "rx", value: prop' value }

instance Attr everything Rx Unit where
  pureAttr Rx _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "rx", value: unset' }
  mapAttr Rx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "rx", value: unset' }
