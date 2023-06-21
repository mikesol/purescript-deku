module Deku.DOM.Attr.StartOffset where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data StartOffset = StartOffset

instance Attr Tags.TextPath_ StartOffset String where
  pureAttr StartOffset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "startOffset", value }
  mapAttr StartOffset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "startOffset", value: prop' value }

instance Attr everything StartOffset Unit where
  pureAttr StartOffset _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "startOffset", value: unset' }
  mapAttr StartOffset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "startOffset", value: unset' }
