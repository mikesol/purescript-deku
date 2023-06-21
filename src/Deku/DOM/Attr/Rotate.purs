module Deku.DOM.Attr.Rotate where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Rotate = Rotate

instance Attr Tags.AnimateMotion_ Rotate String where
  pureAttr Rotate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "rotate", value }

  mapAttr Rotate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "rotate", value: prop' value }

instance Attr Tags.Text_ Rotate String where
  pureAttr Rotate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "rotate", value }

  mapAttr Rotate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "rotate", value: prop' value }

instance Attr Tags.Tspan_ Rotate String where
  pureAttr Rotate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "rotate", value }

  mapAttr Rotate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "rotate", value: prop' value }

instance Attr everything Rotate Unit where
  pureAttr Rotate _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "rotate", value: unset' }
  mapAttr Rotate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "rotate", value: unset' }
