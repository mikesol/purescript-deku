module Deku.DOM.Attr.AriaExpanded where

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

data AriaExpanded = AriaExpanded

instance Attr Circle_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Circle_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Circle_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr Ellipse_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Ellipse_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Ellipse_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr ForeignObject_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr ForeignObject_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr ForeignObject_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr G_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr G_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr G_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr Line_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Line_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Line_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr Marker_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Marker_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Marker_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr Path_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Path_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Path_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr Polygon_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Polygon_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Polygon_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr Polyline_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Polyline_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Polyline_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr Rect_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Rect_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Rect_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr Svg_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Svg_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Svg_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr Symbol_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Symbol_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Symbol_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr Text_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Text_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Text_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr TextPath_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr TextPath_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr TextPath_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr Tspan_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Tspan_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Tspan_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr Use_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr Use_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr Use_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr View_ AriaExpanded (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-expanded", value: prop' value })
instance Attr View_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: prop' value }
instance Attr View_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }

instance Attr everything AriaExpanded (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaExpanded bothValues = unsafeAttribute $ Both
    { key: "aria-expanded", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-expanded", value: unset' })
instance Attr everything AriaExpanded  Unit  where
  attr AriaExpanded _ = unsafeAttribute $ This $ pure $
    { key: "aria-expanded", value: unset' }
instance Attr everything AriaExpanded (Event.Event  Unit ) where
  attr AriaExpanded eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-expanded", value: unset' }
