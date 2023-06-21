module Deku.DOM.Attr.Dx where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Dx = Dx

instance Attr Tags.FeDropShadow_ Dx String where
  pureAttr Dx value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dx", value }

  mapAttr Dx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dx", value: prop' value }

instance Attr Tags.FeOffset_ Dx String where
  pureAttr Dx value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dx", value }

  mapAttr Dx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dx", value: prop' value }

instance Attr Tags.Text_ Dx String where
  pureAttr Dx value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dx", value }

  mapAttr Dx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dx", value: prop' value }

instance Attr Tags.Tspan_ Dx String where
  pureAttr Dx value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dx", value }

  mapAttr Dx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dx", value: prop' value }

instance Attr everything Dx Unit where
  pureAttr Dx _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "dx", value: unset' }
  mapAttr Dx evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dx", value: unset' }
