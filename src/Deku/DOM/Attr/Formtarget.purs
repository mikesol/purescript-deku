module Deku.DOM.Attr.Formtarget where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Formtarget = Formtarget

instance Attr Tags.Button_ Formtarget String where
  pureAttr Formtarget value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "formtarget", value }
  mapAttr Formtarget evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formtarget", value: prop' value }

instance Attr Tags.Input_ Formtarget String where
  pureAttr Formtarget value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "formtarget", value }
  mapAttr Formtarget evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formtarget", value: prop' value }

instance Attr everything Formtarget Unit where
  pureAttr Formtarget _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "formtarget", value: unset' }
  mapAttr Formtarget evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formtarget", value: unset' }
