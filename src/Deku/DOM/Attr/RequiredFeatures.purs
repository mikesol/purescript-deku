module Deku.DOM.Attr.RequiredFeatures where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RequiredFeatures = RequiredFeatures

instance Attr AnimateTransform_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr AnimateTransform_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Discard_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Discard_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Ellipse_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Ellipse_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr ForeignObject_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr ForeignObject_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr G_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr G_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Image_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Image_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Line_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Line_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Marker_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Marker_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Mask_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Mask_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Path_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Path_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Pattern_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Pattern_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Polygon_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Polygon_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Polyline_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Polyline_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Rect_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Rect_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Svg_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Svg_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Switch_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Switch_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Text_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Text_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr TextPath_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr TextPath_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Tspan_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Tspan_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr Use_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute (  
    { key: "requiredFeatures", value: prop' value  } <$ _)
instance Attr Use_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }


instance Attr everything RequiredFeatures  Unit  where
  attr RequiredFeatures _ = unsafeAttribute (  
    { key: "requiredFeatures", value: unset'  } <$ _)
instance Attr everything RequiredFeatures (Event.Event  Unit ) where
  attr RequiredFeatures eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "requiredFeatures", value: unset' }
