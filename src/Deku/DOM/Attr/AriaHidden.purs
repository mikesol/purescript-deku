module Deku.DOM.Attr.AriaHidden where

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

data AriaHidden = AriaHidden

instance Attr Circle_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Circle_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Circle_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr Ellipse_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Ellipse_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Ellipse_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr ForeignObject_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr ForeignObject_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr ForeignObject_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr G_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr G_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr G_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr Line_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Line_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Line_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr Marker_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Marker_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Marker_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr Path_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Path_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Path_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr Polygon_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Polygon_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Polygon_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr Polyline_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Polyline_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Polyline_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr Rect_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Rect_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Rect_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr Svg_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Svg_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Svg_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr Symbol_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Symbol_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Symbol_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr Text_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Text_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Text_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr TextPath_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr TextPath_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr TextPath_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr Tspan_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Tspan_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Tspan_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr Use_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr Use_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr Use_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr View_ AriaHidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-hidden", value: prop' value })
instance Attr View_ AriaHidden  String  where
  attr AriaHidden value = unsafeAttribute $ This
    { key: "aria-hidden", value: prop' value }
instance Attr View_ AriaHidden (Event.Event  String ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-hidden", value: prop' value }

instance Attr everything AriaHidden (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaHidden bothValues = unsafeAttribute $ Both
    { key: "aria-hidden", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-hidden", value: unset' })
instance Attr everything AriaHidden  Unit  where
  attr AriaHidden _ = unsafeAttribute $ This
    { key: "aria-hidden", value: unset' }
instance Attr everything AriaHidden (Event.Event  Unit ) where
  attr AriaHidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-hidden", value: unset' }