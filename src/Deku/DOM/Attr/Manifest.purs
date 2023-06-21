module Deku.DOM.Attr.Manifest where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Manifest = Manifest

instance Attr Tags.Html_ Manifest String where
  pureAttr Manifest value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "manifest", value }

  mapAttr Manifest evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "manifest", value: prop' value }

instance Attr everything Manifest Unit where
  pureAttr Manifest _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "manifest", value: unset' }
  mapAttr Manifest evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "manifest", value: unset' }
