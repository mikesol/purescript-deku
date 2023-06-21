module Deku.DOM.Attr.RefX where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data RefX = RefX

instance Attr Tags.Marker_ RefX String where
  pureAttr RefX value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "refX", value }

  mapAttr RefX evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "refX", value: prop' value }

instance Attr Tags.Symbol_ RefX String where
  pureAttr RefX value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "refX", value }

  mapAttr RefX evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "refX", value: prop' value }

instance Attr everything RefX Unit where
  pureAttr RefX _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "refX", value: unset' }
  mapAttr RefX evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "refX", value: unset' }
