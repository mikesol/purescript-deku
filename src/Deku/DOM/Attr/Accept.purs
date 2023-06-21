module Deku.DOM.Attr.Accept where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Accept = Accept

instance Attr Tags.Form_ Accept String where
  pureAttr Accept value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accept", value }

  mapAttr Accept evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "accept", value: prop' value }

instance Attr Tags.Input_ Accept String where
  pureAttr Accept value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accept", value }

  mapAttr Accept evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "accept", value: prop' value }

instance Attr everything Accept Unit where
  pureAttr Accept _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "accept", value: unset' }
  mapAttr Accept evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accept", value: unset' }
