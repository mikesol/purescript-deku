module Deku.DOM.Attr.Operator where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Operator = Operator

instance Attr Tags.FeComposite_ Operator String where
  pureAttr Operator value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "operator", value }

  mapAttr Operator evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "operator", value: prop' value }

instance Attr Tags.FeMorphology_ Operator String where
  pureAttr Operator value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "operator", value }

  mapAttr Operator evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "operator", value: prop' value }

instance Attr everything Operator Unit where
  pureAttr Operator _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "operator", value: unset' }
  mapAttr Operator evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "operator", value: unset' }
