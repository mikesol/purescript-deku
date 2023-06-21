module Deku.DOM.Attr.Allow where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Allow = Allow

instance Attr Tags.Iframe_ Allow String where
  pureAttr Allow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "allow", value }

  mapAttr Allow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "allow", value: prop' value }

instance Attr everything Allow Unit where
  pureAttr Allow _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "allow", value: unset' }
  mapAttr Allow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "allow", value: unset' }
