module Deku.DOM.Attr.Codebase where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Codebase = Codebase

instance Attr Tags.Applet_ Codebase String where
  pureAttr Codebase value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "codebase", value }

  mapAttr Codebase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "codebase", value: prop' value }

instance Attr everything Codebase Unit where
  pureAttr Codebase _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "codebase", value: unset' }
  mapAttr Codebase evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "codebase", value: unset' }
