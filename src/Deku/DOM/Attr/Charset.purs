module Deku.DOM.Attr.Charset where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Charset = Charset

instance Attr Tags.Meta_ Charset String where
  pureAttr Charset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "charset", value }

  mapAttr Charset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "charset", value: prop' value }

instance Attr Tags.Script_ Charset String where
  pureAttr Charset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "charset", value }

  mapAttr Charset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "charset", value: prop' value }

instance Attr everything Charset Unit where
  pureAttr Charset _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "charset", value: unset' }
  mapAttr Charset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "charset", value: unset' }
