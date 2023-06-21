module Deku.DOM.Attr.AutoReverse where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AutoReverse = AutoReverse

instance Attr Tags.AnimateTransform_ AutoReverse String where
  pureAttr AutoReverse value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autoReverse", value }
  mapAttr AutoReverse evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autoReverse", value: prop' value }

instance Attr everything AutoReverse Unit where
  pureAttr AutoReverse _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "autoReverse", value: unset' }
  mapAttr AutoReverse evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autoReverse", value: unset' }
