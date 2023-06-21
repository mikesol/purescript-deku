module Deku.DOM.Attr.Enctype where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Enctype = Enctype

instance Attr Tags.Form_ Enctype String where
  pureAttr Enctype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enctype", value }

  mapAttr Enctype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "enctype", value: prop' value }

instance Attr everything Enctype Unit where
  pureAttr Enctype _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "enctype", value: unset' }
  mapAttr Enctype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "enctype", value: unset' }
