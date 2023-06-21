module Deku.DOM.Attr.Loop where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Loop = Loop

instance Attr Tags.Audio_ Loop String where
  pureAttr Loop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "loop", value }

  mapAttr Loop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "loop", value: prop' value }

instance Attr Tags.Video_ Loop String where
  pureAttr Loop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "loop", value }

  mapAttr Loop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "loop", value: prop' value }

instance Attr everything Loop Unit where
  pureAttr Loop _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "loop", value: unset' }
  mapAttr Loop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "loop", value: unset' }
