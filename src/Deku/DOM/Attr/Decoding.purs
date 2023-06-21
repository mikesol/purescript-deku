module Deku.DOM.Attr.Decoding where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Decoding = Decoding

instance Attr Tags.Img_ Decoding String where
  pureAttr Decoding value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "decoding", value }

  mapAttr Decoding evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "decoding", value: prop' value }

instance Attr everything Decoding Unit where
  pureAttr Decoding _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "decoding", value: unset' }
  mapAttr Decoding evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "decoding", value: unset' }
