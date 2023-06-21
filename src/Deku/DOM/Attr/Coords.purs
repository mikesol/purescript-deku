module Deku.DOM.Attr.Coords where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Coords = Coords

instance Attr Tags.Area_ Coords String where
  pureAttr Coords value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "coords", value }

  mapAttr Coords evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "coords", value: prop' value }

instance Attr everything Coords Unit where
  pureAttr Coords _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "coords", value: unset' }
  mapAttr Coords evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "coords", value: unset' }
