module Deku.DOM.Attr.Low where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Low = Low

instance Attr Tags.Meter_ Low String where
  pureAttr Low value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "low", value }

  mapAttr Low evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "low", value: prop' value }

instance Attr everything Low Unit where
  pureAttr Low _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "low", value: unset' }
  mapAttr Low evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "low", value: unset' }
