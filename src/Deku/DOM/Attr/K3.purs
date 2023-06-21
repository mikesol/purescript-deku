module Deku.DOM.Attr.K3 where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data K3 = K3

instance Attr Tags.FeComposite_ K3 String where
  pureAttr K3 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "k3", value }

  mapAttr K3 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "k3", value: prop' value }

instance Attr everything K3 Unit where
  pureAttr K3 _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "k3", value: unset' }
  mapAttr K3 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "k3", value: unset' }
