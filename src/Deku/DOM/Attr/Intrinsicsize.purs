module Deku.DOM.Attr.Intrinsicsize where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Intrinsicsize = Intrinsicsize

instance Attr Tags.Img_ Intrinsicsize String where
  pureAttr Intrinsicsize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "intrinsicsize", value }
  mapAttr Intrinsicsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "intrinsicsize", value: prop' value }

instance Attr everything Intrinsicsize Unit where
  pureAttr Intrinsicsize _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "intrinsicsize", value: unset' }
  mapAttr Intrinsicsize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "intrinsicsize", value: unset' }
