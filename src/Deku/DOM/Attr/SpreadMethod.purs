module Deku.DOM.Attr.SpreadMethod where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data SpreadMethod = SpreadMethod

instance Attr Tags.LinearGradient_ SpreadMethod String where
  pureAttr SpreadMethod value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spreadMethod", value }
  mapAttr SpreadMethod evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spreadMethod", value: prop' value }

instance Attr Tags.RadialGradient_ SpreadMethod String where
  pureAttr SpreadMethod value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spreadMethod", value }
  mapAttr SpreadMethod evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spreadMethod", value: prop' value }

instance Attr everything SpreadMethod Unit where
  pureAttr SpreadMethod _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "spreadMethod", value: unset' }
  mapAttr SpreadMethod evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spreadMethod", value: unset' }
