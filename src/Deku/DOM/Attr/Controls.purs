module Deku.DOM.Attr.Controls where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Controls = Controls

instance Attr Tags.Audio_ Controls String where
  pureAttr Controls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "controls", value }

  mapAttr Controls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "controls", value: prop' value }

instance Attr Tags.Video_ Controls String where
  pureAttr Controls value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "controls", value }

  mapAttr Controls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "controls", value: prop' value }

instance Attr everything Controls Unit where
  pureAttr Controls _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "controls", value: unset' }
  mapAttr Controls evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "controls", value: unset' }
