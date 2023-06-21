module Deku.DOM.Attr.Optimum where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Optimum = Optimum

instance Attr Tags.Meter_ Optimum String where
  pureAttr Optimum value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "optimum", value }

  mapAttr Optimum evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "optimum", value: prop' value }

instance Attr everything Optimum Unit where
  pureAttr Optimum _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "optimum", value: unset' }
  mapAttr Optimum evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "optimum", value: unset' }
