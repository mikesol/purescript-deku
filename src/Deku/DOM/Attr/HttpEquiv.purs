module Deku.DOM.Attr.HttpEquiv where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data HttpEquiv = HttpEquiv

instance Attr Tags.Meta_ HttpEquiv String where
  pureAttr HttpEquiv value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "http-equiv", value }
  mapAttr HttpEquiv evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "http-equiv", value: prop' value }

instance Attr everything HttpEquiv Unit where
  pureAttr HttpEquiv _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "http-equiv", value: unset' }
  mapAttr HttpEquiv evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "http-equiv", value: unset' }
