module Deku.DOM.Attr.AriaPressed where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

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

data AriaPressed = AriaPressed

instance Attr Circle_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Circle_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Circle_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Ellipse_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Ellipse_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Ellipse_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr ForeignObject_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr ForeignObject_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr ForeignObject_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr G_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr G_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr G_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Line_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Line_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Line_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Marker_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Marker_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Marker_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Path_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Path_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Path_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Polygon_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Polygon_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Polygon_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Polyline_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Polyline_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Polyline_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Rect_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Rect_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Rect_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Svg_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Svg_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Svg_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Symbol_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Symbol_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Symbol_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Text_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Text_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Text_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr TextPath_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr TextPath_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr TextPath_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Tspan_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Tspan_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Tspan_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Use_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Use_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Use_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr View_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr View_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr View_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr everything AriaPressed (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-pressed", value: unset' })
instance Attr everything AriaPressed  Unit  where
  attr AriaPressed _ = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: unset' }
instance Attr everything AriaPressed (Event.Event  Unit ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-pressed", value: unset' }
