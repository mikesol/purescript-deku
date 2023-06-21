module Deku.DOM.Attr.Integrity where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Integrity = Integrity

instance Attr Tags.Link_ Integrity String where
  pureAttr Integrity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "integrity", value }
  mapAttr Integrity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "integrity", value: prop' value }

instance Attr Tags.Script_ Integrity String where
  pureAttr Integrity value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "integrity", value }
  mapAttr Integrity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "integrity", value: prop' value }

instance Attr everything Integrity Unit where
  pureAttr Integrity _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "integrity", value: unset' }
  mapAttr Integrity evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "integrity", value: unset' }
