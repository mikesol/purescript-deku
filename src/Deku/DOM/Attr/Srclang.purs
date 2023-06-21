module Deku.DOM.Attr.Srclang where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Srclang = Srclang

instance Attr Tags.Track_ Srclang String where
  pureAttr Srclang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "srclang", value }

  mapAttr Srclang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "srclang", value: prop' value }

instance Attr everything Srclang Unit where
  pureAttr Srclang _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "srclang", value: unset' }
  mapAttr Srclang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "srclang", value: unset' }
