module Deku.DOM.Attr.RefY where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data RefY = RefY

instance Attr Tags.Marker_ RefY String where
  pureAttr RefY value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "refY", value }

  mapAttr RefY evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "refY", value: prop' value }

instance Attr Tags.Symbol_ RefY String where
  pureAttr RefY value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "refY", value }

  mapAttr RefY evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "refY", value: prop' value }

instance Attr everything RefY Unit where
  pureAttr RefY _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "refY", value: unset' }
  mapAttr RefY evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "refY", value: unset' }
