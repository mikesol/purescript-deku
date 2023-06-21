module Deku.DOM.Attr.StitchTiles where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data StitchTiles = StitchTiles

instance Attr Tags.FeTurbulence_ StitchTiles String where
  pureAttr StitchTiles value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stitchTiles", value }
  mapAttr StitchTiles evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stitchTiles", value: prop' value }

instance Attr everything StitchTiles Unit where
  pureAttr StitchTiles _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "stitchTiles", value: unset' }
  mapAttr StitchTiles evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stitchTiles", value: unset' }
