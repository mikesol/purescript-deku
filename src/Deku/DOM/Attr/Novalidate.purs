module Deku.DOM.Attr.Novalidate where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Novalidate = Novalidate

instance Attr Tags.Form_ Novalidate String where
  pureAttr Novalidate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "novalidate", value }
  mapAttr Novalidate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "novalidate", value: prop' value }

instance Attr everything Novalidate Unit where
  pureAttr Novalidate _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "novalidate", value: unset' }
  mapAttr Novalidate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "novalidate", value: unset' }
