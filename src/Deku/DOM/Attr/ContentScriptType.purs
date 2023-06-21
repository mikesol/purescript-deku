module Deku.DOM.Attr.ContentScriptType where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ContentScriptType = ContentScriptType

instance Attr Tags.Svg_ ContentScriptType String where
  pureAttr ContentScriptType value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "contentScriptType", value }
  mapAttr ContentScriptType evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contentScriptType", value: prop' value }

instance Attr everything ContentScriptType Unit where
  pureAttr ContentScriptType _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "contentScriptType", value: unset' }
  mapAttr ContentScriptType evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contentScriptType", value: unset' }
