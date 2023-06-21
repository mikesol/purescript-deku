module Deku.DOM.Attr.Seed where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Seed = Seed

instance Attr Tags.FeTurbulence_ Seed String where
  pureAttr Seed value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "seed", value }

  mapAttr Seed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "seed", value: prop' value }

instance Attr everything Seed Unit where
  pureAttr Seed _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "seed", value: unset' }
  mapAttr Seed evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "seed", value: unset' }
