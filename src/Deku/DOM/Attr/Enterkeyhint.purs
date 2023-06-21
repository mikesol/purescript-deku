module Deku.DOM.Attr.Enterkeyhint where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Enterkeyhint = Enterkeyhint

instance Attr Tags.Textarea_ Enterkeyhint String where
  pureAttr Enterkeyhint value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enterkeyhint", value }
  mapAttr Enterkeyhint evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "enterkeyhint", value: prop' value }

instance Attr everything Enterkeyhint Unit where
  pureAttr Enterkeyhint _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "enterkeyhint", value: unset' }
  mapAttr Enterkeyhint evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "enterkeyhint", value: unset' }
