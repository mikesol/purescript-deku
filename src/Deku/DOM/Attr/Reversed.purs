module Deku.DOM.Attr.Reversed where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Reversed = Reversed

instance Attr Tags.Ol_ Reversed String where
  pureAttr Reversed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "reversed", value }

  mapAttr Reversed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "reversed", value: prop' value }

instance Attr everything Reversed Unit where
  pureAttr Reversed _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "reversed", value: unset' }
  mapAttr Reversed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "reversed", value: unset' }
