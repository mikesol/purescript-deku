module Deku.DOM.Attr.Ismap where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Ismap = Ismap

instance Attr Tags.Img_ Ismap String where
  pureAttr Ismap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "ismap", value }

  mapAttr Ismap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "ismap", value: prop' value }

instance Attr everything Ismap Unit where
  pureAttr Ismap _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "ismap", value: unset' }
  mapAttr Ismap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "ismap", value: unset' }
