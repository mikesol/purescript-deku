module Deku.DOM.Attr.AriaPlaceholder where

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

data AriaPlaceholder = AriaPlaceholder

instance Attr Circle_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Circle_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Circle_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Ellipse_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Ellipse_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Ellipse_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr ForeignObject_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr ForeignObject_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr ForeignObject_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr G_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr G_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr G_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Line_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Line_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Line_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Marker_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Marker_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Marker_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Path_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Path_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Path_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Polygon_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Polygon_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Polygon_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Polyline_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Polyline_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Polyline_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Rect_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Rect_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Rect_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Svg_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Svg_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Svg_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Symbol_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Symbol_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Symbol_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Text_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Text_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Text_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr TextPath_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr TextPath_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr TextPath_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Tspan_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Tspan_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Tspan_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Use_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr Use_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr Use_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr View_ AriaPlaceholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
instance Attr View_ AriaPlaceholder  String  where
  attr AriaPlaceholder value = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: prop' value }
instance Attr View_ AriaPlaceholder (Event.Event  String ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr everything AriaPlaceholder (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-placeholder", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-placeholder", value: unset' })
instance Attr everything AriaPlaceholder  Unit  where
  attr AriaPlaceholder _ = unsafeAttribute $ This $ pure $
    { key: "aria-placeholder", value: unset' }
instance Attr everything AriaPlaceholder (Event.Event  Unit ) where
  attr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "aria-placeholder", value: unset' }
