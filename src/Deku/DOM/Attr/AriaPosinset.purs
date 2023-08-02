module Deku.DOM.Attr.AriaPosinset where

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

data AriaPosinset = AriaPosinset

instance Attr Circle_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Circle_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Circle_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr Ellipse_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Ellipse_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Ellipse_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr ForeignObject_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr ForeignObject_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr ForeignObject_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr G_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr G_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr G_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr Line_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Line_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Line_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr Marker_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Marker_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Marker_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr Path_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Path_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Path_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr Polygon_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Polygon_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Polygon_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr Polyline_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Polyline_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Polyline_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr Rect_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Rect_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Rect_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr Svg_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Svg_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Svg_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr Symbol_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Symbol_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Symbol_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr Text_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Text_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Text_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr TextPath_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr TextPath_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr TextPath_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr Tspan_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Tspan_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Tspan_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr Use_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr Use_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr Use_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr View_ AriaPosinset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-posinset", value: prop' value })
instance Attr View_ AriaPosinset  String  where
  attr AriaPosinset value = unsafeAttribute $ This
    { key: "aria-posinset", value: prop' value }
instance Attr View_ AriaPosinset (Event.Event  String ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-posinset", value: prop' value }

instance Attr everything AriaPosinset (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaPosinset bothValues = unsafeAttribute $ Both
    { key: "aria-posinset", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-posinset", value: unset' })
instance Attr everything AriaPosinset  Unit  where
  attr AriaPosinset _ = unsafeAttribute $ This
    { key: "aria-posinset", value: unset' }
instance Attr everything AriaPosinset (Event.Event  Unit ) where
  attr AriaPosinset eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-posinset", value: unset' }