module Deku.DOM.Attr.Radius where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Radius = Radius

instance Attr Tags.FeMorphology_ Radius String where
  pureAttr Radius value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radius", value }

  mapAttr Radius evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "radius", value: prop' value }

instance Attr everything Radius Unit where
  pureAttr Radius _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "radius", value: unset' }
  mapAttr Radius evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radius", value: unset' }
