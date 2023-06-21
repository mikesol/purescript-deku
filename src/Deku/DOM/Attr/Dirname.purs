module Deku.DOM.Attr.Dirname where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Dirname = Dirname

instance Attr Tags.Input_ Dirname String where
  pureAttr Dirname value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dirname", value }

  mapAttr Dirname evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dirname", value: prop' value }

instance Attr Tags.Textarea_ Dirname String where
  pureAttr Dirname value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dirname", value }

  mapAttr Dirname evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dirname", value: prop' value }

instance Attr everything Dirname Unit where
  pureAttr Dirname _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "dirname", value: unset' }
  mapAttr Dirname evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dirname", value: unset' }
