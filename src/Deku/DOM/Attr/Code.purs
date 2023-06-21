module Deku.DOM.Attr.Code where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Code = Code

instance Attr Tags.Applet_ Code String where
  pureAttr Code value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "code", value }

  mapAttr Code evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "code", value: prop' value }

instance Attr everything Code Unit where
  pureAttr Code _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "code", value: unset' }
  mapAttr Code evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "code", value: unset' }
