module Deku.DOM.Attr.Sizes where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Sizes = Sizes

instance Attr Tags.Link_ Sizes String where
  pureAttr Sizes value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "sizes", value }

  mapAttr Sizes evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "sizes", value: prop' value }

instance Attr Tags.Img_ Sizes String where
  pureAttr Sizes value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "sizes", value }

  mapAttr Sizes evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "sizes", value: prop' value }

instance Attr Tags.Source_ Sizes String where
  pureAttr Sizes value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "sizes", value }

  mapAttr Sizes evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "sizes", value: prop' value }

instance Attr everything Sizes Unit where
  pureAttr Sizes _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "sizes", value: unset' }
  mapAttr Sizes evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "sizes", value: unset' }
