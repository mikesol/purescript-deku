module Deku.DOM.Attr.Summary where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Summary = Summary

instance Attr Tags.Table_ Summary String where
  pureAttr Summary value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "summary", value }

  mapAttr Summary evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "summary", value: prop' value }

instance Attr everything Summary Unit where
  pureAttr Summary _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "summary", value: unset' }
  mapAttr Summary evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "summary", value: unset' }
