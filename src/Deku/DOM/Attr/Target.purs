module Deku.DOM.Attr.Target where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Target = Target

instance Attr Tags.A_ Target String where
  pureAttr Target value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "target", value }

  mapAttr Target evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "target", value: prop' value }

instance Attr Tags.Area_ Target String where
  pureAttr Target value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "target", value }

  mapAttr Target evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "target", value: prop' value }

instance Attr Tags.Base_ Target String where
  pureAttr Target value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "target", value }

  mapAttr Target evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "target", value: prop' value }

instance Attr Tags.Form_ Target String where
  pureAttr Target value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "target", value }

  mapAttr Target evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "target", value: prop' value }

instance Attr everything Target Unit where
  pureAttr Target _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "target", value: unset' }
  mapAttr Target evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "target", value: unset' }
