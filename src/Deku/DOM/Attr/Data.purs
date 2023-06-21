module Deku.DOM.Attr.Data where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Data = Data

instance Attr Tags.Object_ Data String where
  pureAttr Data value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "data", value }

  mapAttr Data evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "data", value: prop' value }

instance Attr everything Data Unit where
  pureAttr Data _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "data", value: unset' }
  mapAttr Data evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "data", value: unset' }
