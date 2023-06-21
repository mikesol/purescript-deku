module Deku.DOM.Attr.Language where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Language = Language

instance Attr Tags.Script_ Language String where
  pureAttr Language value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "language", value }

  mapAttr Language evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "language", value: prop' value }

instance Attr everything Language Unit where
  pureAttr Language _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "language", value: unset' }
  mapAttr Language evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "language", value: unset' }
