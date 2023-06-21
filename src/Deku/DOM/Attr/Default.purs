module Deku.DOM.Attr.Default where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Default = Default

instance Attr Tags.Track_ Default String where
  pureAttr Default value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "default", value }

  mapAttr Default evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "default", value: prop' value }

instance Attr everything Default Unit where
  pureAttr Default _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "default", value: unset' }
  mapAttr Default evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "default", value: unset' }
