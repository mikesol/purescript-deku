module Deku.DOM.Attr.Maxlength where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Maxlength = Maxlength

instance Attr Tags.Input_ Maxlength String where
  pureAttr Maxlength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "maxlength", value }
  mapAttr Maxlength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "maxlength", value: prop' value }

instance Attr Tags.Textarea_ Maxlength String where
  pureAttr Maxlength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "maxlength", value }
  mapAttr Maxlength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "maxlength", value: prop' value }

instance Attr everything Maxlength Unit where
  pureAttr Maxlength _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "maxlength", value: unset' }
  mapAttr Maxlength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "maxlength", value: unset' }
