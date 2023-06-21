module Deku.DOM.Attr.Scope where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Scope = Scope

instance Attr Tags.Th_ Scope String where
  pureAttr Scope value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "scope", value }

  mapAttr Scope evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "scope", value: prop' value }

instance Attr everything Scope Unit where
  pureAttr Scope _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "scope", value: unset' }
  mapAttr Scope evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "scope", value: unset' }
