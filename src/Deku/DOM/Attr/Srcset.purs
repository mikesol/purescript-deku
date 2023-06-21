module Deku.DOM.Attr.Srcset where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Srcset = Srcset

instance Attr Tags.Img_ Srcset String where
  pureAttr Srcset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "srcset", value }

  mapAttr Srcset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "srcset", value: prop' value }

instance Attr Tags.Source_ Srcset String where
  pureAttr Srcset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "srcset", value }

  mapAttr Srcset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "srcset", value: prop' value }

instance Attr everything Srcset Unit where
  pureAttr Srcset _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "srcset", value: unset' }
  mapAttr Srcset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "srcset", value: unset' }
