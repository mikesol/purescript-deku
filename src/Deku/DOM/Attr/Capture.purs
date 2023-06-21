module Deku.DOM.Attr.Capture where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Capture = Capture

instance Attr Tags.Input_ Capture String where
  pureAttr Capture value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "capture", value }

  mapAttr Capture evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "capture", value: prop' value }

instance Attr everything Capture Unit where
  pureAttr Capture _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "capture", value: unset' }
  mapAttr Capture evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "capture", value: unset' }
