module Deku.DOM.Attr.Sandbox where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Sandbox = Sandbox

instance Attr Tags.Iframe_ Sandbox String where
  pureAttr Sandbox value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "sandbox", value }

  mapAttr Sandbox evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "sandbox", value: prop' value }

instance Attr everything Sandbox Unit where
  pureAttr Sandbox _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "sandbox", value: unset' }
  mapAttr Sandbox evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "sandbox", value: unset' }
