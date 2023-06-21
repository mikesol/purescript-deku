module Deku.DOM.Attr.ContentStyleType where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ContentStyleType = ContentStyleType

instance Attr Tags.Svg_ ContentStyleType String where
  pureAttr ContentStyleType value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contentStyleType", value }
  mapAttr ContentStyleType evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contentStyleType", value: prop' value }

instance Attr everything ContentStyleType Unit where
  pureAttr ContentStyleType _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "contentStyleType", value: unset' }
  mapAttr ContentStyleType evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "contentStyleType", value: unset' }
