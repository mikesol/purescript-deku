module Deku.DOM.Attr.Open where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Open = Open

instance Attr Tags.Details_ Open String where
  pureAttr Open value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "open", value }

  mapAttr Open evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "open", value: prop' value }

instance Attr Tags.Dialog_ Open String where
  pureAttr Open value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "open", value }

  mapAttr Open evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "open", value: prop' value }

instance Attr everything Open Unit where
  pureAttr Open _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "open", value: unset' }
  mapAttr Open evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "open", value: unset' }
