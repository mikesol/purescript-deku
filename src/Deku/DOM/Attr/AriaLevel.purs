module Deku.DOM.Attr.AriaLevel where

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

data AriaLevel = AriaLevel

instance Attr Circle_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Circle_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Circle_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr Ellipse_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Ellipse_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Ellipse_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr ForeignObject_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr ForeignObject_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr ForeignObject_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr G_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr G_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr G_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr Line_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Line_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Line_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr Marker_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Marker_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Marker_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr Path_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Path_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Path_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr Polygon_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Polygon_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Polygon_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr Polyline_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Polyline_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Polyline_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr Rect_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Rect_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Rect_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr Svg_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Svg_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Svg_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr Symbol_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Symbol_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Symbol_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr Text_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Text_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Text_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr TextPath_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr TextPath_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr TextPath_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr Tspan_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Tspan_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Tspan_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr Use_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr Use_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr Use_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr View_ AriaLevel (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-level", value: prop' value })
instance Attr View_ AriaLevel  String  where
  attr AriaLevel value = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: prop' value }
instance Attr View_ AriaLevel (Event.Event  String ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-level", value: prop' value }

instance Attr everything AriaLevel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaLevel bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-level", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-level", value: unset' })
instance Attr everything AriaLevel  Unit  where
  attr AriaLevel _ = unsafeAttribute $ This $ pure $
    { key: "aria-level", value: unset' }
instance Attr everything AriaLevel (Event.Event  Unit ) where
  attr AriaLevel eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-level", value: unset' }
