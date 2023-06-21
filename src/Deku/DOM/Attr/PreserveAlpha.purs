module Deku.DOM.Attr.PreserveAlpha where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data PreserveAlpha = PreserveAlpha

instance Attr Tags.FeConvolveMatrix_ PreserveAlpha String where
  pureAttr PreserveAlpha value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "preserveAlpha", value }
  mapAttr PreserveAlpha evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "preserveAlpha", value: prop' value }

instance Attr everything PreserveAlpha Unit where
  pureAttr PreserveAlpha _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "preserveAlpha", value: unset' }
  mapAttr PreserveAlpha evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "preserveAlpha", value: unset' }
