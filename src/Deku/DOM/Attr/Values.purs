module Deku.DOM.Attr.Values where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Values = Values

instance Attr Tags.Animate_ Values String where
  pureAttr Values value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "values", value }

  mapAttr Values evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "evalues", value: prop' value }

instance Attr Tags.AnimateMotion_ Values String where
  pureAttr Values value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "values", value }

  mapAttr Values evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "evalues", value: prop' value }

instance Attr Tags.AnimateTransform_ Values String where
  pureAttr Values value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "values", value }

  mapAttr Values evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "evalues", value: prop' value }

instance Attr Tags.FeColorMatrix_ Values String where
  pureAttr Values value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "values", value }

  mapAttr Values evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "evalues", value: prop' value }

instance Attr everything Values Unit where
  pureAttr Values _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "values", value: unset' }
  mapAttr Values evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "values", value: unset' }
