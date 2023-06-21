module Deku.DOM.Attr.Cite where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Cite = Cite

instance Attr Tags.Blockquote_ Cite String where
  pureAttr Cite value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cite", value }

  mapAttr Cite evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cite", value: prop' value }

instance Attr Tags.Del_ Cite String where
  pureAttr Cite value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cite", value }

  mapAttr Cite evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cite", value: prop' value }

instance Attr Tags.Ins_ Cite String where
  pureAttr Cite value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cite", value }

  mapAttr Cite evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cite", value: prop' value }

instance Attr Tags.Q_ Cite String where
  pureAttr Cite value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cite", value }

  mapAttr Cite evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cite", value: prop' value }

instance Attr everything Cite Unit where
  pureAttr Cite _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "cite", value: unset' }
  mapAttr Cite evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "cite", value: unset' }
