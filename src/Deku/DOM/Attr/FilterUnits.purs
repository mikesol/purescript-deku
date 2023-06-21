module Deku.DOM.Attr.FilterUnits where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data FilterUnits = FilterUnits

instance Attr Tags.Filter_ FilterUnits String where
  pureAttr FilterUnits value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "filterUnits", value }
  mapAttr FilterUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "filterUnits", value: prop' value }

instance Attr everything FilterUnits Unit where
  pureAttr FilterUnits _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "filterUnits", value: unset' }
  mapAttr FilterUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "filterUnits", value: unset' }
