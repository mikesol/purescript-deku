module Deku.DOM.Attr.Defer where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Defer = Defer

instance Attr Tags.Script_ Defer String where
  pureAttr Defer value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "defer", value }

  mapAttr Defer evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "defer", value: prop' value }

instance Attr everything Defer Unit where
  pureAttr Defer _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "defer", value: unset' }
  mapAttr Defer evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "defer", value: unset' }
