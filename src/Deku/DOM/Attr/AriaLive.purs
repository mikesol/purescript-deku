module Deku.DOM.Attr.AriaLive where

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

data AriaLive = AriaLive

instance Attr Circle_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Circle_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Circle_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr Ellipse_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Ellipse_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Ellipse_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr ForeignObject_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr ForeignObject_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr ForeignObject_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr G_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr G_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr G_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr Line_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Line_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Line_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr Marker_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Marker_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Marker_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr Path_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Path_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Path_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr Polygon_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Polygon_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Polygon_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr Polyline_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Polyline_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Polyline_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr Rect_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Rect_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Rect_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr Svg_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Svg_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Svg_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr Symbol_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Symbol_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Symbol_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr Text_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Text_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Text_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr TextPath_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr TextPath_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr TextPath_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr Tspan_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Tspan_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Tspan_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr Use_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr Use_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr Use_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr View_ AriaLive (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-live", value: prop' value })
instance Attr View_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: prop' value }
instance Attr View_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-live", value: prop' value }

instance Attr everything AriaLive (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaLive bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-live", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-live", value: unset' })
instance Attr everything AriaLive  Unit  where
  attr AriaLive _ = unsafeAttribute $ This $ pure $
    { key: "aria-live", value: unset' }
instance Attr everything AriaLive (Event.Event  Unit ) where
  attr AriaLive eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "aria-live", value: unset' }
