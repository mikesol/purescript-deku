module Deku.DOM.Attr.AriaBusy where

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

data AriaBusy = AriaBusy

instance Attr Circle_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Circle_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Circle_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr Ellipse_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Ellipse_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Ellipse_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr ForeignObject_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr ForeignObject_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr ForeignObject_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr G_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr G_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr G_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr Line_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Line_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Line_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr Marker_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Marker_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Marker_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr Path_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Path_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Path_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr Polygon_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Polygon_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Polygon_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr Polyline_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Polyline_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Polyline_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr Rect_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Rect_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Rect_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr Svg_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Svg_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Svg_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr Symbol_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Symbol_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Symbol_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr Text_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Text_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Text_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr TextPath_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr TextPath_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr TextPath_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr Tspan_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Tspan_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Tspan_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr Use_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr Use_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr Use_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr View_ AriaBusy (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-busy", value: prop' value })
instance Attr View_ AriaBusy  String  where
  attr AriaBusy value = unsafeAttribute $ This
    { key: "aria-busy", value: prop' value }
instance Attr View_ AriaBusy (Event.Event  String ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-busy", value: prop' value }

instance Attr everything AriaBusy (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaBusy bothValues = unsafeAttribute $ Both
    { key: "aria-busy", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-busy", value: unset' })
instance Attr everything AriaBusy  Unit  where
  attr AriaBusy _ = unsafeAttribute $ This
    { key: "aria-busy", value: unset' }
instance Attr everything AriaBusy (Event.Event  Unit ) where
  attr AriaBusy eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "aria-busy", value: unset' }
