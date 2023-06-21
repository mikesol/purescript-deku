module Deku.DOM.Attr.Minlength where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Minlength = Minlength

instance Attr Tags.Input_ Minlength String where
  pureAttr Minlength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "minlength", value }
  mapAttr Minlength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "minlength", value: prop' value }

instance Attr Tags.Textarea_ Minlength String where
  pureAttr Minlength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "minlength", value }
  mapAttr Minlength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "minlength", value: prop' value }

instance Attr everything Minlength Unit where
  pureAttr Minlength _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "minlength", value: unset' }
  mapAttr Minlength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "minlength", value: unset' }
