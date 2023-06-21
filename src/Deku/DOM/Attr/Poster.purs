module Deku.DOM.Attr.Poster where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Poster = Poster

instance Attr Tags.Video_ Poster String where
  pureAttr Poster value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "poster", value }

  mapAttr Poster evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "poster", value: prop' value }

instance Attr everything Poster Unit where
  pureAttr Poster _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "poster", value: unset' }
  mapAttr Poster evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "poster", value: unset' }
