module Deku.DOM.Attr.Formmethod where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Formmethod = Formmethod

instance Attr Tags.Button_ Formmethod String where
  pureAttr Formmethod value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "formmethod", value }
  mapAttr Formmethod evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formmethod", value: prop' value }

instance Attr Tags.Input_ Formmethod String where
  pureAttr Formmethod value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "formmethod", value }
  mapAttr Formmethod evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formmethod", value: prop' value }

instance Attr everything Formmethod Unit where
  pureAttr Formmethod _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "formmethod", value: unset' }
  mapAttr Formmethod evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formmethod", value: unset' }
