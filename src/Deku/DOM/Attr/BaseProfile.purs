module Deku.DOM.Attr.BaseProfile where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data BaseProfile = BaseProfile

instance Attr Tags.Svg_ BaseProfile String where
  pureAttr BaseProfile value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseProfile", value }
  mapAttr BaseProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseProfile", value: prop' value }

instance Attr everything BaseProfile Unit where
  pureAttr BaseProfile _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "baseProfile", value: unset' }
  mapAttr BaseProfile evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseProfile", value: unset' }
