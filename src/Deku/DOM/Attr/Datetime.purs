module Deku.DOM.Attr.Datetime where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Datetime = Datetime

instance Attr Tags.Del_ Datetime String where
  pureAttr Datetime value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "datetime", value }

  mapAttr Datetime evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "datetime", value: prop' value }

instance Attr Tags.Ins_ Datetime String where
  pureAttr Datetime value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "datetime", value }

  mapAttr Datetime evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "datetime", value: prop' value }

instance Attr Tags.Time_ Datetime String where
  pureAttr Datetime value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "datetime", value }

  mapAttr Datetime evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "datetime", value: prop' value }

instance Attr everything Datetime Unit where
  pureAttr Datetime _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "datetime", value: unset' }
  mapAttr Datetime evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "datetime", value: unset' }
