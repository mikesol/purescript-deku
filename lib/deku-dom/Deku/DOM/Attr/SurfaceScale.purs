module Deku.DOM.Attr.SurfaceScale where

import Prelude

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SurfaceScale = SurfaceScale

instance Attr FeDiffuseLighting_ SurfaceScale String where
  attr SurfaceScale value = unsafeAttribute
    { key: "surfaceScale", value: prop' value }

instance Attr FeSpecularLighting_ SurfaceScale String where
  attr SurfaceScale value = unsafeAttribute
    { key: "surfaceScale", value: prop' value }

instance Attr everything SurfaceScale Unit where
  attr SurfaceScale _ = unsafeAttribute
    { key: "surfaceScale", value: unset' }
