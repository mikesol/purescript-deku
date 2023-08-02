module Deku.DOM.Attr.AriaFlowto where

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

data AriaFlowto = AriaFlowto

instance Attr Circle_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Circle_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Circle_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr Ellipse_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Ellipse_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Ellipse_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr ForeignObject_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr ForeignObject_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr ForeignObject_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr G_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr G_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr G_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr Line_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Line_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Line_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr Marker_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Marker_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Marker_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr Path_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Path_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Path_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr Polygon_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Polygon_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Polygon_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr Polyline_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Polyline_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Polyline_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr Rect_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Rect_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Rect_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr Svg_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Svg_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Svg_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr Symbol_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Symbol_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Symbol_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr Text_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Text_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Text_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr TextPath_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr TextPath_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr TextPath_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr Tspan_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Tspan_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Tspan_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr Use_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr Use_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr Use_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr View_ AriaFlowto (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-flowto", value: prop' value })
instance Attr View_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute $ This
    { key: "aria-flowto", value: prop' value }
instance Attr View_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }

instance Attr everything AriaFlowto (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaFlowto bothValues = unsafeAttribute $ Both
    { key: "aria-flowto", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-flowto", value: unset' })
instance Attr everything AriaFlowto  Unit  where
  attr AriaFlowto _ = unsafeAttribute $ This
    { key: "aria-flowto", value: unset' }
instance Attr everything AriaFlowto (Event.Event  Unit ) where
  attr AriaFlowto eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-flowto", value: unset' }