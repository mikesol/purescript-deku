module Deku.DOM.Attr.FilterRes where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FilterRes = FilterRes

instance Attr Tags.Filter_ FilterRes String where
  pureAttr FilterRes value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filterRes", value }
  mapAttr FilterRes evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "filterRes", value: prop' value }

instance Attr everything FilterRes Unit where
  pureAttr FilterRes _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "filterRes", value: unset' }
  mapAttr FilterRes evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "filterRes", value: unset' }
