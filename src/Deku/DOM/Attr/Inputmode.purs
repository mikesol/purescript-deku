module Deku.DOM.Attr.Inputmode where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Inputmode = Inputmode

instance Attr Tags.Textarea_ Inputmode String where
  pureAttr Inputmode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "inputmode", value }
  mapAttr Inputmode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "inputmode", value: prop' value }

instance Attr everything Inputmode Unit where
  pureAttr Inputmode _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "inputmode", value: unset' }
  mapAttr Inputmode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "inputmode", value: unset' }
