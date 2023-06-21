module Deku.DOM.Attr.Fy where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Fy = Fy

instance Attr Tags.RadialGradient_ Fy String where
  pureAttr Fy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "fy", value }

  mapAttr Fy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "fy", value: prop' value }

instance Attr everything Fy Unit where
  pureAttr Fy _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "fy", value: unset' }
  mapAttr Fy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "fy", value: unset' }
