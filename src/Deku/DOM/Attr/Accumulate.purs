module Deku.DOM.Attr.Accumulate where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Accumulate = Accumulate

instance Attr Tags.Animate_ Accumulate String where
  pureAttr Accumulate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accumulate", value }
  mapAttr Accumulate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accumulate", value: prop' value }

instance Attr Tags.AnimateMotion_ Accumulate String where
  pureAttr Accumulate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accumulate", value }
  mapAttr Accumulate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accumulate", value: prop' value }

instance Attr Tags.AnimateTransform_ Accumulate String where
  pureAttr Accumulate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accumulate", value }
  mapAttr Accumulate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accumulate", value: prop' value }

instance Attr everything Accumulate Unit where
  pureAttr Accumulate _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "accumulate", value: unset' }
  mapAttr Accumulate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accumulate", value: unset' }
