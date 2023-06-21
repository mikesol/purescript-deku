module Deku.DOM.Attr.Placeholder where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Placeholder = Placeholder

instance Attr Tags.Input_ Placeholder String where
  pureAttr Placeholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "placeholder", value }
  mapAttr Placeholder evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "placeholder", value: prop' value }

instance Attr Tags.Textarea_ Placeholder String where
  pureAttr Placeholder value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "placeholder", value }
  mapAttr Placeholder evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "placeholder", value: prop' value }

instance Attr everything Placeholder Unit where
  pureAttr Placeholder _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "placeholder", value: unset' }
  mapAttr Placeholder evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "placeholder", value: unset' }
