module Deku.DOM.Attr.Srcdoc where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Srcdoc = Srcdoc

instance Attr Tags.Iframe_ Srcdoc String where
  pureAttr Srcdoc value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "srcdoc", value }

  mapAttr Srcdoc evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "srcdoc", value: prop' value }

instance Attr everything Srcdoc Unit where
  pureAttr Srcdoc _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "srcdoc", value: unset' }
  mapAttr Srcdoc evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "srcdoc", value: unset' }
