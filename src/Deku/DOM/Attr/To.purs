module Deku.DOM.Attr.To where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data To = To

instance Attr Tags.Animate_ To String where
  pureAttr To value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "to", value }

  mapAttr To evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "to", value: prop' value }

instance Attr Tags.AnimateMotion_ To String where
  pureAttr To value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "to", value }

  mapAttr To evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "to", value: prop' value }

instance Attr Tags.AnimateTransform_ To String where
  pureAttr To value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "to", value }

  mapAttr To evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "to", value: prop' value }

instance Attr Tags.Set_ To String where
  pureAttr To value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "to", value }

  mapAttr To evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "to", value: prop' value }

instance Attr everything To Unit where
  pureAttr To _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "to", value: unset' }
  mapAttr To evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "to", value: unset' }
