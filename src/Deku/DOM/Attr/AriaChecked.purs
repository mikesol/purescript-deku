module Deku.DOM.Attr.AriaChecked where

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

data AriaChecked = AriaChecked

instance Attr Circle_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Circle_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Circle_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr Ellipse_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Ellipse_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Ellipse_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr ForeignObject_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr ForeignObject_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr ForeignObject_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr G_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr G_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr G_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr Line_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Line_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Line_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr Marker_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Marker_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Marker_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr Path_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Path_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Path_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr Polygon_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Polygon_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Polygon_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr Polyline_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Polyline_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Polyline_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr Rect_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Rect_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Rect_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr Svg_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Svg_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Svg_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr Symbol_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Symbol_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Symbol_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr Text_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Text_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Text_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr TextPath_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr TextPath_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr TextPath_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr Tspan_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Tspan_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Tspan_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr Use_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr Use_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr Use_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr View_ AriaChecked (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-checked", value: prop' value })
instance Attr View_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute $ This
    { key: "aria-checked", value: prop' value }
instance Attr View_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }

instance Attr everything AriaChecked (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaChecked bothValues = unsafeAttribute $ Both
    { key: "aria-checked", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-checked", value: unset' })
instance Attr everything AriaChecked  Unit  where
  attr AriaChecked _ = unsafeAttribute $ This
    { key: "aria-checked", value: unset' }
instance Attr everything AriaChecked (Event.Event  Unit ) where
  attr AriaChecked eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-checked", value: unset' }
