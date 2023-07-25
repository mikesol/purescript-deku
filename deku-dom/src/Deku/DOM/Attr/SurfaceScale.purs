module Deku.DOM.Attr.SurfaceScale where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)

data SurfaceScale = SurfaceScale

instance Deku.Attribute.Attr everything SurfaceScale Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "surfaceScale", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeDiffuseLighting_ SurfaceScale String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "surfaceScale", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpecularLighting_ SurfaceScale String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "surfaceScale", value: _ } <<<
    Deku.Attribute.prop'
