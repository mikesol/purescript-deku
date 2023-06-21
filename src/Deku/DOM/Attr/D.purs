module Deku.DOM.Attr.D where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data D = D

instance Attr Tags.Path_ D String where
  pureAttr D value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "d", value }

  mapAttr D evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "d", value: prop' value }

instance Attr everything D Unit where
  pureAttr D _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "d", value: unset' }
  mapAttr D evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "d", value: unset' }
