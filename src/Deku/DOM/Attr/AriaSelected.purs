module Deku.DOM.Attr.AriaSelected where

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

data AriaSelected = AriaSelected

instance Attr Circle_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Circle_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Circle_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr Ellipse_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Ellipse_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Ellipse_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr ForeignObject_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr ForeignObject_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr ForeignObject_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr G_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr G_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr G_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr Line_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Line_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Line_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr Marker_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Marker_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Marker_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr Path_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Path_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Path_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr Polygon_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Polygon_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Polygon_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr Polyline_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Polyline_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Polyline_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr Rect_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Rect_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Rect_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr Svg_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Svg_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Svg_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr Symbol_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Symbol_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Symbol_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr Text_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Text_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Text_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr TextPath_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr TextPath_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr TextPath_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr Tspan_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Tspan_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Tspan_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr Use_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr Use_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr Use_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr View_ AriaSelected (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-selected", value: prop' value })
instance Attr View_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute $ This
    { key: "aria-selected", value: prop' value }
instance Attr View_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }

instance Attr everything AriaSelected (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaSelected bothValues = unsafeAttribute $ Both
    { key: "aria-selected", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-selected", value: unset' })
instance Attr everything AriaSelected  Unit  where
  attr AriaSelected _ = unsafeAttribute $ This
    { key: "aria-selected", value: unset' }
instance Attr everything AriaSelected (Event.Event  Unit ) where
  attr AriaSelected eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-selected", value: unset' }
