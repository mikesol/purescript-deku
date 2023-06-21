module Deku.DOM.Attr.PatternTransform where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data PatternTransform = PatternTransform

instance Attr Tags.Pattern_ PatternTransform String where
  pureAttr PatternTransform value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "patternTransform", value }
  mapAttr PatternTransform evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "patternTransform", value: prop' value }

instance Attr everything PatternTransform Unit where
  pureAttr PatternTransform _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "patternTransform", value: unset' }
  mapAttr PatternTransform evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "patternTransform", value: unset' }
