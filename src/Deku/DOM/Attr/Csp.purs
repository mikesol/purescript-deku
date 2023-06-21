module Deku.DOM.Attr.Csp where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Csp = Csp

instance Attr Tags.Iframe_ Csp String where
  pureAttr Csp value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "csp", value }

  mapAttr Csp evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "csp", value: prop' value }

instance Attr everything Csp Unit where
  pureAttr Csp _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "csp", value: unset' }
  mapAttr Csp evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "csp", value: unset' }
