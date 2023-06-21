module Deku.DOM.Attr.Action where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Action = Action

instance Attr Tags.Form_ Action String where
  pureAttr Action value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "action", value }

  mapAttr Action evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "action", value: prop' value }

instance Attr everything Action Unit where
  pureAttr Action _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "action", value: unset' }
  mapAttr Action evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "action", value: unset' }
