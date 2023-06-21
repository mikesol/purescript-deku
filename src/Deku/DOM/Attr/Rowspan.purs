module Deku.DOM.Attr.Rowspan where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Rowspan = Rowspan

instance Attr Tags.Td_ Rowspan String where
  pureAttr Rowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "rowspan", value }

  mapAttr Rowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "rowspan", value: prop' value }

instance Attr Tags.Th_ Rowspan String where
  pureAttr Rowspan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "rowspan", value }

  mapAttr Rowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "rowspan", value: prop' value }

instance Attr everything Rowspan Unit where
  pureAttr Rowspan _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "rowspan", value: unset' }
  mapAttr Rowspan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "rowspan", value: unset' }
