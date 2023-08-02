module Deku.DOM.Attr.AriaReadonly where

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

data AriaReadonly = AriaReadonly

instance Attr Circle_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Circle_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Circle_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr Ellipse_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Ellipse_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Ellipse_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr ForeignObject_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr ForeignObject_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr ForeignObject_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr G_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr G_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr G_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr Line_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Line_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Line_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr Marker_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Marker_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Marker_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr Path_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Path_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Path_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr Polygon_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Polygon_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Polygon_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr Polyline_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Polyline_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Polyline_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr Rect_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Rect_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Rect_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr Svg_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Svg_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Svg_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr Symbol_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Symbol_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Symbol_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr Text_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Text_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Text_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr TextPath_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr TextPath_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr TextPath_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr Tspan_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Tspan_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Tspan_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr Use_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr Use_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr Use_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr View_ AriaReadonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-readonly", value: prop' value })
instance Attr View_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute $ This
    { key: "aria-readonly", value: prop' value }
instance Attr View_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }

instance Attr everything AriaReadonly (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaReadonly bothValues = unsafeAttribute $ Both
    { key: "aria-readonly", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-readonly", value: unset' })
instance Attr everything AriaReadonly  Unit  where
  attr AriaReadonly _ = unsafeAttribute $ This
    { key: "aria-readonly", value: unset' }
instance Attr everything AriaReadonly (Event.Event  Unit ) where
  attr AriaReadonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-readonly", value: unset' }
