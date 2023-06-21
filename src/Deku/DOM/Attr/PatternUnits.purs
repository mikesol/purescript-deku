module Deku.DOM.Attr.PatternUnits where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data PatternUnits = PatternUnits

instance Attr Tags.Pattern_ PatternUnits String where
  pureAttr PatternUnits value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "patternUnits", value }
  mapAttr PatternUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "patternUnits", value: prop' value }

instance Attr everything PatternUnits Unit where
  pureAttr PatternUnits _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "patternUnits", value: unset' }
  mapAttr PatternUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "patternUnits", value: unset' }
