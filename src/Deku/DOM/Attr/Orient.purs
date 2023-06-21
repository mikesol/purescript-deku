module Deku.DOM.Attr.Orient where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Orient = Orient

instance Attr Tags.Marker_ Orient String where
  pureAttr Orient value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "orient", value }

  mapAttr Orient evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "orient", value: prop' value }

instance Attr everything Orient Unit where
  pureAttr Orient _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "orient", value: unset' }
  mapAttr Orient evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "orient", value: unset' }
