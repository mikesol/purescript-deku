module Deku.DOM.Attr.Selected where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Selected = Selected

instance Attr Tags.Option_ Selected String where
  pureAttr Selected value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "selected", value }

  mapAttr Selected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "selected", value: prop' value }

instance Attr everything Selected Unit where
  pureAttr Selected _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "selected", value: unset' }
  mapAttr Selected evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "selected", value: unset' }
