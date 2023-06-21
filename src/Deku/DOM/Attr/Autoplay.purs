module Deku.DOM.Attr.Autoplay where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Autoplay = Autoplay

instance Attr Tags.Audio_ Autoplay String where
  pureAttr Autoplay value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autoplay", value }

  mapAttr Autoplay evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "autoplay", value: prop' value }

instance Attr Tags.Video_ Autoplay String where
  pureAttr Autoplay value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autoplay", value }

  mapAttr Autoplay evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "autoplay", value: prop' value }

instance Attr everything Autoplay Unit where
  pureAttr Autoplay _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "autoplay", value: unset' }
  mapAttr Autoplay evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autoplay", value: unset' }
