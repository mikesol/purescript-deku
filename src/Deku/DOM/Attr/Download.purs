module Deku.DOM.Attr.Download where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Download = Download

instance Attr Tags.A_ Download String where
  pureAttr Download value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "download", value }

  mapAttr Download evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "download", value: prop' value }

instance Attr Tags.Area_ Download String where
  pureAttr Download value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "download", value }

  mapAttr Download evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "download", value: prop' value }

instance Attr everything Download Unit where
  pureAttr Download _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "download", value: unset' }
  mapAttr Download evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "download", value: unset' }
