module Deku.DOM.Attr.Label where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Label = Label

instance Attr Tags.Optgroup_ Label String where
  pureAttr Label value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "label", value }

  mapAttr Label evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "label", value: prop' value }

instance Attr Tags.Option_ Label String where
  pureAttr Label value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "label", value }

  mapAttr Label evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "label", value: prop' value }

instance Attr Tags.Track_ Label String where
  pureAttr Label value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "label", value }

  mapAttr Label evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "label", value: prop' value }

instance Attr everything Label Unit where
  pureAttr Label _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "label", value: unset' }
  mapAttr Label evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "label", value: unset' }
