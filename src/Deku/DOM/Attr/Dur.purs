module Deku.DOM.Attr.Dur where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Dur = Dur

instance Attr Tags.Animate_ Dur String where
  pureAttr Dur value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dur", value }

  mapAttr Dur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dur", value: prop' value }

instance Attr Tags.AnimateMotion_ Dur String where
  pureAttr Dur value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dur", value }

  mapAttr Dur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dur", value: prop' value }

instance Attr Tags.AnimateTransform_ Dur String where
  pureAttr Dur value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dur", value }

  mapAttr Dur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dur", value: prop' value }

instance Attr Tags.Set_ Dur String where
  pureAttr Dur value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dur", value }

  mapAttr Dur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dur", value: prop' value }

instance Attr everything Dur Unit where
  pureAttr Dur _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "dur", value: unset' }
  mapAttr Dur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dur", value: unset' }
