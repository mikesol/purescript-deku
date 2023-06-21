module Deku.DOM.Attr.Start where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Start = Start

instance Attr Tags.Ol_ Start String where
  pureAttr Start value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "start", value }

  mapAttr Start evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "start", value: prop' value }

instance Attr everything Start Unit where
  pureAttr Start _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "start", value: unset' }
  mapAttr Start evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "start", value: unset' }
