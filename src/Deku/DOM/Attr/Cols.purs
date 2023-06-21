module Deku.DOM.Attr.Cols where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Cols = Cols

instance Attr Tags.Textarea_ Cols String where
  pureAttr Cols value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cols", value }

  mapAttr Cols evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cols", value: prop' value }

instance Attr everything Cols Unit where
  pureAttr Cols _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "cols", value: unset' }
  mapAttr Cols evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "cols", value: unset' }
