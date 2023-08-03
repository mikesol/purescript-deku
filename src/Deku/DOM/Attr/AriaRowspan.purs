module Deku.DOM.Attr.AriaRowspan where

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

data AriaRowspan = AriaRowspan

instance Attr Circle_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Circle_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Circle_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr Ellipse_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Ellipse_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Ellipse_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr ForeignObject_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr ForeignObject_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr ForeignObject_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr G_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr G_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr G_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr Line_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Line_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Line_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr Marker_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Marker_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Marker_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr Path_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Path_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Path_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr Polygon_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Polygon_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Polygon_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr Polyline_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Polyline_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Polyline_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr Rect_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Rect_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Rect_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr Svg_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Svg_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Svg_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr Symbol_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Symbol_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Symbol_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr Text_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Text_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Text_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr TextPath_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr TextPath_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr TextPath_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr Tspan_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Tspan_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Tspan_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr Use_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr Use_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr Use_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr View_ AriaRowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowspan", value: prop' value })
instance Attr View_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: prop' value }
instance Attr View_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }

instance Attr everything AriaRowspan (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaRowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowspan", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-rowspan", value: unset' })
instance Attr everything AriaRowspan  Unit  where
  attr AriaRowspan _ = unsafeAttribute $ This $ pure $
    { key: "aria-rowspan", value: unset' }
instance Attr everything AriaRowspan (Event.Event  Unit ) where
  attr AriaRowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-rowspan", value: unset' }
