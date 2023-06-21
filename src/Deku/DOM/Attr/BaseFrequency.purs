module Deku.DOM.Attr.BaseFrequency where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data BaseFrequency = BaseFrequency

instance Attr Tags.FeTurbulence_ BaseFrequency String where
  pureAttr BaseFrequency value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "baseFrequency", value }
  mapAttr BaseFrequency evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseFrequency", value: prop' value }

instance Attr everything BaseFrequency Unit where
  pureAttr BaseFrequency _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "baseFrequency", value: unset' }
  mapAttr BaseFrequency evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "baseFrequency", value: unset' }
