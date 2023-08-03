module Deku.DOM.Attr.AriaKeyshortcuts where

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

data AriaKeyshortcuts = AriaKeyshortcuts

instance Attr Circle_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Circle_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Circle_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr Ellipse_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Ellipse_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Ellipse_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr ForeignObject_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr ForeignObject_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr ForeignObject_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr G_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr G_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr G_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr Line_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Line_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Line_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr Marker_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Marker_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Marker_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr Path_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Path_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Path_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr Polygon_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Polygon_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Polygon_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr Polyline_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Polyline_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Polyline_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr Rect_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Rect_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Rect_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr Svg_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Svg_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Svg_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr Symbol_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Symbol_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Symbol_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr Text_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Text_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Text_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr TextPath_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr TextPath_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr TextPath_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr Tspan_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Tspan_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Tspan_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr Use_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr Use_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr Use_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr View_ AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-keyshortcuts", value: prop' value }
    )
instance Attr View_ AriaKeyshortcuts  String  where
  attr AriaKeyshortcuts value = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: prop' value }
instance Attr View_ AriaKeyshortcuts (Event.Event  String ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-keyshortcuts", value: prop' value }

instance Attr everything AriaKeyshortcuts (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaKeyshortcuts bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-keyshortcuts", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-keyshortcuts", value: unset' })
instance Attr everything AriaKeyshortcuts  Unit  where
  attr AriaKeyshortcuts _ = unsafeAttribute $ This $ pure $
    { key: "aria-keyshortcuts", value: unset' }
instance Attr everything AriaKeyshortcuts (Event.Event  Unit ) where
  attr AriaKeyshortcuts eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "aria-keyshortcuts", value: unset' }
