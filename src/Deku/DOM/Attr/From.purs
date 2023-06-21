module Deku.DOM.Attr.From where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data From = From

instance Attr Tags.Animate_ From String where
  pureAttr From value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "from", value }

  mapAttr From evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "from", value: prop' value }

instance Attr Tags.AnimateMotion_ From String where
  pureAttr From value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "from", value }

  mapAttr From evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "from", value: prop' value }

instance Attr Tags.AnimateTransform_ From String where
  pureAttr From value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "from", value }

  mapAttr From evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "from", value: prop' value }

instance Attr everything From Unit where
  pureAttr From _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "from", value: unset' }
  mapAttr From evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "from", value: unset' }
