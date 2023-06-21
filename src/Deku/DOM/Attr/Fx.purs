module Deku.DOM.Attr.Fx where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Fx = Fx

instance Attr Tags.RadialGradient_ Fx String where
  pureAttr Fx value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fx", value }

  mapAttr Fx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fx", value: prop' value }

instance Attr everything Fx Unit where
  pureAttr Fx _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "fx", value: unset' }
  mapAttr Fx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fx", value: unset' }
