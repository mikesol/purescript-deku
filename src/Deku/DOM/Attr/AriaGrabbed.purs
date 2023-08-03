module Deku.DOM.Attr.AriaGrabbed where

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

data AriaGrabbed = AriaGrabbed

instance Attr Circle_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Circle_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Circle_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr Ellipse_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Ellipse_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Ellipse_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr ForeignObject_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr ForeignObject_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr ForeignObject_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr G_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr G_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr G_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr Line_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Line_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Line_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr Marker_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Marker_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Marker_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr Path_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Path_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Path_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr Polygon_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Polygon_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Polygon_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr Polyline_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Polyline_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Polyline_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr Rect_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Rect_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Rect_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr Svg_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Svg_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Svg_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr Symbol_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Symbol_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Symbol_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr Text_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Text_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Text_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr TextPath_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr TextPath_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr TextPath_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr Tspan_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Tspan_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Tspan_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr Use_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr Use_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr Use_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr View_ AriaGrabbed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-grabbed", value: prop' value })
instance Attr View_ AriaGrabbed  String  where
  attr AriaGrabbed value = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: prop' value }
instance Attr View_ AriaGrabbed (Event.Event  String ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-grabbed", value: prop' value }

instance Attr everything AriaGrabbed (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaGrabbed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-grabbed", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-grabbed", value: unset' })
instance Attr everything AriaGrabbed  Unit  where
  attr AriaGrabbed _ = unsafeAttribute $ This $ pure $
    { key: "aria-grabbed", value: unset' }
instance Attr everything AriaGrabbed (Event.Event  Unit ) where
  attr AriaGrabbed eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-grabbed", value: unset' }
