module Deku.DOM.Attr.AriaInvalid where

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

data AriaInvalid = AriaInvalid

instance Attr Circle_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Circle_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Circle_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Ellipse_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Ellipse_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Ellipse_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr ForeignObject_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr ForeignObject_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr ForeignObject_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr G_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr G_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr G_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Line_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Line_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Line_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Marker_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Marker_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Marker_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Path_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Path_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Path_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Polygon_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Polygon_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Polygon_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Polyline_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Polyline_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Polyline_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Rect_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Rect_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Rect_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Svg_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Svg_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Svg_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Symbol_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Symbol_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Symbol_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Text_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Text_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Text_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr TextPath_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr TextPath_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr TextPath_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Tspan_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Tspan_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Tspan_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Use_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Use_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr Use_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr View_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr View_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This
    { key: "aria-invalid", value: prop' value }
instance Attr View_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr everything AriaInvalid (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both
    { key: "aria-invalid", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-invalid", value: unset' })
instance Attr everything AriaInvalid  Unit  where
  attr AriaInvalid _ = unsafeAttribute $ This
    { key: "aria-invalid", value: unset' }
instance Attr everything AriaInvalid (Event.Event  Unit ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-invalid", value: unset' }
