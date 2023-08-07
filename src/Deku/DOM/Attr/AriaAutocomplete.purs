module Deku.DOM.Attr.AriaAutocomplete where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AriaAutocomplete = AriaAutocomplete

instance Attr Circle_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Circle_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr Ellipse_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr ForeignObject_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr G_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr G_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr Line_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Line_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr Marker_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Marker_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr Path_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Path_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr Polygon_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Polygon_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr Polyline_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Polyline_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr Rect_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Rect_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr Svg_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Svg_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr Symbol_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Symbol_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr Text_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Text_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr TextPath_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr TextPath_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr Tspan_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Tspan_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr Use_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr Use_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr View_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute (  
    { key: "aria-autocomplete", value: prop' value  } <$ _)
instance Attr View_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }


instance Attr everything AriaAutocomplete  Unit  where
  attr AriaAutocomplete _ = unsafeAttribute (  
    { key: "aria-autocomplete", value: unset'  } <$ _)
instance Attr everything AriaAutocomplete (Event.Event  Unit ) where
  attr AriaAutocomplete eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "aria-autocomplete", value: unset' }
