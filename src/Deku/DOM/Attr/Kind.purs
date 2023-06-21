module Deku.DOM.Attr.Kind where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Kind = Kind

instance Attr Tags.Track_ Kind String where
  pureAttr Kind value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kind", value }

  mapAttr Kind evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "kind", value: prop' value }

instance Attr everything Kind Unit where
  pureAttr Kind _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "kind", value: unset' }
  mapAttr Kind evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "kind", value: unset' }
