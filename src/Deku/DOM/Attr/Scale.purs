module Deku.DOM.Attr.Scale where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Scale = Scale

instance Attr Tags.FeDisplacementMap_ Scale String where
  pureAttr Scale value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "scale", value }

  mapAttr Scale evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "scale", value: prop' value }

instance Attr everything Scale Unit where
  pureAttr Scale _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "scale", value: unset' }
  mapAttr Scale evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "scale", value: unset' }
