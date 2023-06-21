module Deku.DOM.Attr.NumOctaves where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data NumOctaves = NumOctaves

instance Attr Tags.FeTurbulence_ NumOctaves String where
  pureAttr NumOctaves value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "numOctaves", value }
  mapAttr NumOctaves evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "numOctaves", value: prop' value }

instance Attr everything NumOctaves Unit where
  pureAttr NumOctaves _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "numOctaves", value: unset' }
  mapAttr NumOctaves evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "numOctaves", value: unset' }
