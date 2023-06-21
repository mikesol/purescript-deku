module Deku.DOM.Attr.Step where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Step = Step

instance Attr Tags.Input_ Step String where
  pureAttr Step value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "step", value }

  mapAttr Step evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "step", value: prop' value }

instance Attr everything Step Unit where
  pureAttr Step _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "step", value: unset' }
  mapAttr Step evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "step", value: unset' }
