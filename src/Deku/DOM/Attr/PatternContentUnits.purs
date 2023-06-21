module Deku.DOM.Attr.PatternContentUnits where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data PatternContentUnits = PatternContentUnits

instance Attr Tags.Pattern_ PatternContentUnits String where
  pureAttr PatternContentUnits value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "patternContentUnits", value }
  mapAttr PatternContentUnits evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "patternContentUnits", value: prop' value }

instance Attr everything PatternContentUnits Unit where
  pureAttr PatternContentUnits _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "patternContentUnits", value: unset' }
  mapAttr PatternContentUnits evalue = unsafeAttribute $ Right $ evalue <#>
    \_ -> unsafeVolatileAttribute
      { key: "patternContentUnits", value: unset' }
