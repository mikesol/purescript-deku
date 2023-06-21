module Deku.DOM.Attr.Formaction where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Formaction = Formaction

instance Attr Tags.Input_ Formaction String where
  pureAttr Formaction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "formaction", value }
  mapAttr Formaction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formaction", value: prop' value }

instance Attr Tags.Button_ Formaction String where
  pureAttr Formaction value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "formaction", value }
  mapAttr Formaction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formaction", value: prop' value }

instance Attr everything Formaction Unit where
  pureAttr Formaction _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "formaction", value: unset' }
  mapAttr Formaction evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formaction", value: unset' }
