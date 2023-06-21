module Deku.DOM.Attr.SurfaceScale where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data SurfaceScale = SurfaceScale

instance Attr Tags.FeDiffuseLighting_ SurfaceScale String where
  pureAttr SurfaceScale value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "surfaceScale", value }
  mapAttr SurfaceScale evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "surfaceScale", value: prop' value }

instance Attr Tags.FeSpecularLighting_ SurfaceScale String where
  pureAttr SurfaceScale value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "surfaceScale", value }
  mapAttr SurfaceScale evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "surfaceScale", value: prop' value }

instance Attr everything SurfaceScale Unit where
  pureAttr SurfaceScale _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "surfaceScale", value: unset' }
  mapAttr SurfaceScale evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "surfaceScale", value: unset' }
