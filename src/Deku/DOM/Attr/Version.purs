module Deku.DOM.Attr.Version where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Version = Version

instance Attr Tags.Svg_ Version String where
  pureAttr Version value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "version", value }

  mapAttr Version evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "version", value: prop' value }

instance Attr everything Version Unit where
  pureAttr Version _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "version", value: unset' }
  mapAttr Version evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "version", value: unset' }
