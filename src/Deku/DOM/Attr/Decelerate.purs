module Deku.DOM.Attr.Decelerate where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Decelerate = Decelerate

instance Attr Tags.AnimateTransform_ Decelerate String where
  pureAttr Decelerate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "decelerate", value }
  mapAttr Decelerate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "decelerate", value: prop' value }

instance Attr everything Decelerate Unit where
  pureAttr Decelerate _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "decelerate", value: unset' }
  mapAttr Decelerate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "decelerate", value: unset' }
