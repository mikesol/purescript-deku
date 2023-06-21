module Deku.DOM.Attr.Order where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Order = Order

instance Attr Tags.FeConvolveMatrix_ Order String where
  pureAttr Order value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "order", value }

  mapAttr Order evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "order", value: prop' value }

instance Attr everything Order Unit where
  pureAttr Order _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "order", value: unset' }
  mapAttr Order evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "order", value: unset' }
