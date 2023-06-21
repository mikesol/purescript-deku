module Deku.DOM.Attr.ViewTarget where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ViewTarget = ViewTarget

instance Attr Tags.View_ ViewTarget String where
  pureAttr ViewTarget value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "viewTarget", value }
  mapAttr ViewTarget evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "viewTarget", value: prop' value }

instance Attr everything ViewTarget Unit where
  pureAttr ViewTarget _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "viewTarget", value: unset' }
  mapAttr ViewTarget evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "viewTarget", value: unset' }
