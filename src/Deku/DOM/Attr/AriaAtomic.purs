module Deku.DOM.Attr.AriaAtomic where

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

data AriaAtomic = AriaAtomic

instance Attr Circle_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Circle_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Circle_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr Ellipse_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Ellipse_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Ellipse_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr ForeignObject_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr ForeignObject_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr ForeignObject_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr G_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr G_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr G_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr Line_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Line_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Line_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr Marker_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Marker_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Marker_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr Path_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Path_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Path_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr Polygon_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Polygon_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Polygon_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr Polyline_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Polyline_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Polyline_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr Rect_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Rect_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Rect_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr Svg_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Svg_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Svg_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr Symbol_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Symbol_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Symbol_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr Text_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Text_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Text_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr TextPath_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr TextPath_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr TextPath_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr Tspan_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Tspan_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Tspan_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr Use_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr Use_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr Use_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr View_ AriaAtomic (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-atomic", value: prop' value })
instance Attr View_ AriaAtomic  String  where
  attr AriaAtomic value = unsafeAttribute $ This
    { key: "aria-atomic", value: prop' value }
instance Attr View_ AriaAtomic (Event.Event  String ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-atomic", value: prop' value }

instance Attr everything AriaAtomic (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaAtomic bothValues = unsafeAttribute $ Both
    { key: "aria-atomic", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-atomic", value: unset' })
instance Attr everything AriaAtomic  Unit  where
  attr AriaAtomic _ = unsafeAttribute $ This
    { key: "aria-atomic", value: unset' }
instance Attr everything AriaAtomic (Event.Event  Unit ) where
  attr AriaAtomic eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-atomic", value: unset' }
