module Deku.DOM.Attr.Shape where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Shape = Shape

instance Attr Tags.A_ Shape String where
  pureAttr Shape value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape", value }

  mapAttr Shape evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "shape", value: prop' value }

instance Attr Tags.Area_ Shape String where
  pureAttr Shape value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "shape", value }

  mapAttr Shape evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "shape", value: prop' value }

instance Attr everything Shape Unit where
  pureAttr Shape _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "shape", value: unset' }
  mapAttr Shape evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "shape", value: unset' }
