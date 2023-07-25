module Deku.DOM.Attr.SystemLanguage where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
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

data SystemLanguage = SystemLanguage

instance Deku.Attribute.Attr everything SystemLanguage Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "systemLanguage", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Circle_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Discard_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Ellipse_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr ForeignObject_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr G_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Image_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Line_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Path_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Polygon_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Polyline_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Rect_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Set_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Svg_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Switch_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Text_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Use_ SystemLanguage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "systemLanguage", value: _ } <<<
    Deku.Attribute.prop'
