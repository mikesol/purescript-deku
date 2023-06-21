module Deku.DOM.Attr.Async where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Async = Async

instance Attr Tags.Script_ Async String where
  pureAttr Async value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "async", value }

  mapAttr Async evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "async", value: prop' value }

instance Attr everything Async Unit where
  pureAttr Async _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "async", value: unset' }
  mapAttr Async evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "async", value: unset' }
