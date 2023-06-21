module Deku.DOM.Attr.Divisor where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Divisor = Divisor

instance Attr Tags.FeConvolveMatrix_ Divisor String where
  pureAttr Divisor value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "divisor", value }

  mapAttr Divisor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "divisor", value: prop' value }

instance Attr everything Divisor Unit where
  pureAttr Divisor _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "divisor", value: unset' }
  mapAttr Divisor evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "divisor", value: unset' }
