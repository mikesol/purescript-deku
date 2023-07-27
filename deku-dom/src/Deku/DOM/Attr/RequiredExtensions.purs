module Deku.DOM.Attr.RequiredExtensions where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Use (Use_)

data RequiredExtensions = RequiredExtensions

instance Deku.Attribute.Attr everything RequiredExtensions Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "requiredExtensions", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr A_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Animate_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Circle_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Discard_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Ellipse_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr ForeignObject_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr G_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Image_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Line_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Path_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Polygon_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Polyline_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Rect_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Set_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Svg_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Switch_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Text_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Use_ RequiredExtensions String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<<
    Deku.Attribute.prop'
