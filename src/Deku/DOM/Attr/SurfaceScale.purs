module Deku.DOM.Attr.SurfaceScale where

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data SurfaceScale = SurfaceScale

instance Attr FeDiffuseLighting_ SurfaceScale String where
  attr SurfaceScale value = unsafeAttribute { key: "surfaceScale", value: prop' value }
instance Attr FeSpecularLighting_ SurfaceScale String where
  attr SurfaceScale value = unsafeAttribute { key: "surfaceScale", value: prop' value }