module Deku.DOM.Attr.Spacing where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Spacing = Spacing

instance Attr Tags.TextPath_ Spacing String where
  pureAttr Spacing value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spacing", value }

  mapAttr Spacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "spacing", value: prop' value }

instance Attr everything Spacing Unit where
  pureAttr Spacing _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "spacing", value: unset' }
  mapAttr Spacing evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spacing", value: unset' }
