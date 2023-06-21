module Deku.DOM.Attr.Path where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Path = Path

instance Attr Tags.AnimateMotion_ Path String where
  pureAttr Path value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "path", value }

  mapAttr Path evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "path", value: prop' value }

instance Attr Tags.TextPath_ Path String where
  pureAttr Path value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "path", value }

  mapAttr Path evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "path", value: prop' value }

instance Attr everything Path Unit where
  pureAttr Path _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "path", value: unset' }
  mapAttr Path evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "path", value: unset' }
