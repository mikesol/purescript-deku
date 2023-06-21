module Deku.DOM.Attr.Bias where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Bias = Bias

instance Attr Tags.FeConvolveMatrix_ Bias String where
  pureAttr Bias value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "bias", value }

  mapAttr Bias evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "bias", value: prop' value }

instance Attr everything Bias Unit where
  pureAttr Bias _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "bias", value: unset' }
  mapAttr Bias evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "bias", value: unset' }
