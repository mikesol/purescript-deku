module Deku.DOM.Attr.Autocomplete where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Autocomplete = Autocomplete

instance Attr Tags.Form_ Autocomplete String where
  pureAttr Autocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocomplete", value }
  mapAttr Autocomplete evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocomplete", value: prop' value }

instance Attr Tags.Input_ Autocomplete String where
  pureAttr Autocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocomplete", value }
  mapAttr Autocomplete evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocomplete", value: prop' value }

instance Attr Tags.Select_ Autocomplete String where
  pureAttr Autocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocomplete", value }
  mapAttr Autocomplete evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocomplete", value: prop' value }

instance Attr Tags.Textarea_ Autocomplete String where
  pureAttr Autocomplete value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocomplete", value }
  mapAttr Autocomplete evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocomplete", value: prop' value }

instance Attr everything Autocomplete Unit where
  pureAttr Autocomplete _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "autocomplete", value: unset' }
  mapAttr Autocomplete evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocomplete", value: unset' }
