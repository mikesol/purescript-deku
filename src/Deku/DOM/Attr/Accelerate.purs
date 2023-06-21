module Deku.DOM.Attr.Accelerate where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Accelerate = Accelerate

instance Attr Tags.AnimateTransform_ Accelerate String where
  pureAttr Accelerate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accelerate", value }
  mapAttr Accelerate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accelerate", value: prop' value }

instance Attr everything Accelerate Unit where
  pureAttr Accelerate _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "accelerate", value: unset' }
  mapAttr Accelerate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accelerate", value: unset' }
