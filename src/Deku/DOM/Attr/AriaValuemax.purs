module Deku.DOM.Attr.AriaValuemax where

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

data AriaValuemax = AriaValuemax

instance Attr Circle_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Circle_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Circle_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Ellipse_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Ellipse_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Ellipse_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr ForeignObject_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr ForeignObject_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr ForeignObject_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr G_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr G_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr G_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Line_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Line_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Line_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Marker_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Marker_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Marker_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Path_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Path_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Path_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Polygon_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Polygon_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Polygon_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Polyline_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Polyline_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Polyline_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Rect_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Rect_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Rect_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Svg_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Svg_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Svg_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Symbol_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Symbol_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Symbol_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Text_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Text_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Text_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr TextPath_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr TextPath_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr TextPath_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Tspan_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Tspan_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Tspan_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Use_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Use_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr Use_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr View_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr View_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This
    { key: "aria-valuemax", value: prop' value }
instance Attr View_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr everything AriaValuemax (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both
    { key: "aria-valuemax", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-valuemax", value: unset' })
instance Attr everything AriaValuemax  Unit  where
  attr AriaValuemax _ = unsafeAttribute $ This
    { key: "aria-valuemax", value: unset' }
instance Attr everything AriaValuemax (Event.Event  Unit ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-valuemax", value: unset' }
