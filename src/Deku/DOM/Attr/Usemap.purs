module Deku.DOM.Attr.Usemap where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Usemap = Usemap

instance Attr Tags.Img_ Usemap String where
  pureAttr Usemap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "usemap", value }

  mapAttr Usemap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "usemap", value: prop' value }

instance Attr Tags.Input_ Usemap String where
  pureAttr Usemap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "usemap", value }

  mapAttr Usemap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "usemap", value: prop' value }

instance Attr Tags.Object_ Usemap String where
  pureAttr Usemap value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "usemap", value }

  mapAttr Usemap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "usemap", value: prop' value }

instance Attr everything Usemap Unit where
  pureAttr Usemap _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "usemap", value: unset' }
  mapAttr Usemap evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "usemap", value: unset' }
