module Deku.DOM.Attr.Ping where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Ping = Ping

instance Attr Tags.A_ Ping String where
  pureAttr Ping value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "ping", value }

  mapAttr Ping evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "ping", value: prop' value }

instance Attr Tags.Area_ Ping String where
  pureAttr Ping value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "ping", value }

  mapAttr Ping evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "ping", value: prop' value }

instance Attr everything Ping Unit where
  pureAttr Ping _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "ping", value: unset' }
  mapAttr Ping evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "ping", value: unset' }
