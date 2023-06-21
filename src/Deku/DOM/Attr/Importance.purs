module Deku.DOM.Attr.Importance where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Importance = Importance

instance Attr Tags.Iframe_ Importance String where
  pureAttr Importance value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "importance", value }
  mapAttr Importance evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "importance", value: prop' value }

instance Attr Tags.Img_ Importance String where
  pureAttr Importance value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "importance", value }
  mapAttr Importance evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "importance", value: prop' value }

instance Attr Tags.Link_ Importance String where
  pureAttr Importance value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "importance", value }
  mapAttr Importance evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "importance", value: prop' value }

instance Attr Tags.Script_ Importance String where
  pureAttr Importance value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "importance", value }
  mapAttr Importance evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "importance", value: prop' value }

instance Attr everything Importance Unit where
  pureAttr Importance _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "importance", value: unset' }
  mapAttr Importance evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "importance", value: unset' }
