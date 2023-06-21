module Deku.DOM.Attr.Content where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Content = Content

instance Attr Tags.Meta_ Content String where
  pureAttr Content value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "content", value }

  mapAttr Content evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "content", value: prop' value }

instance Attr everything Content Unit where
  pureAttr Content _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "content", value: unset' }
  mapAttr Content evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "content", value: unset' }
