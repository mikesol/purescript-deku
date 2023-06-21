module Deku.DOM.Attr.KeyPoints where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data KeyPoints = KeyPoints

instance Attr Tags.AnimateMotion_ KeyPoints String where
  pureAttr KeyPoints value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keyPoints", value }
  mapAttr KeyPoints evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keyPoints", value: prop' value }

instance Attr everything KeyPoints Unit where
  pureAttr KeyPoints _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "keyPoints", value: unset' }
  mapAttr KeyPoints evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keyPoints", value: unset' }
