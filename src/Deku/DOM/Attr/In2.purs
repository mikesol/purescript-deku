module Deku.DOM.Attr.In2 where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data In2 = In2

instance Attr Tags.FeBlend_ In2 String where
  pureAttr In2 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in2", value }

  mapAttr In2 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in2", value: prop' value }

instance Attr Tags.FeComposite_ In2 String where
  pureAttr In2 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in2", value }

  mapAttr In2 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in2", value: prop' value }

instance Attr Tags.FeDisplacementMap_ In2 String where
  pureAttr In2 value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "in2", value }

  mapAttr In2 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "in2", value: prop' value }

instance Attr everything In2 Unit where
  pureAttr In2 _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "in2", value: unset' }
  mapAttr In2 evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "in2", value: unset' }
