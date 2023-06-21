module Deku.DOM.Attr.AcceptCharset where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AcceptCharset = AcceptCharset

instance Attr Tags.Form_ AcceptCharset String where
  pureAttr AcceptCharset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accept-charset", value }
  mapAttr AcceptCharset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accept-charset", value: prop' value }

instance Attr everything AcceptCharset Unit where
  pureAttr AcceptCharset _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "accept-charset", value: unset' }
  mapAttr AcceptCharset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accept-charset", value: unset' }
