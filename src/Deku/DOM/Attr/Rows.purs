module Deku.DOM.Attr.Rows where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Rows = Rows

instance Attr Tags.Textarea_ Rows String where
  pureAttr Rows value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "rows", value }

  mapAttr Rows evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "rows", value: prop' value }

instance Attr everything Rows Unit where
  pureAttr Rows _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "rows", value: unset' }
  mapAttr Rows evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "rows", value: unset' }
