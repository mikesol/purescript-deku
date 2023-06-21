module Deku.DOM.Attr.Formenctype where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Formenctype = Formenctype

instance Attr Tags.Button_ Formenctype String where
  pureAttr Formenctype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "formenctype", value }
  mapAttr Formenctype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formenctype", value: prop' value }

instance Attr Tags.Input_ Formenctype String where
  pureAttr Formenctype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "formenctype", value }
  mapAttr Formenctype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formenctype", value: prop' value }

instance Attr everything Formenctype Unit where
  pureAttr Formenctype _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "formenctype", value: unset' }
  mapAttr Formenctype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formenctype", value: unset' }
