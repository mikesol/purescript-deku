module Deku.DOM.Attr.AriaDescribedby where

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

data AriaDescribedby = AriaDescribedby

instance Attr Circle_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Circle_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Circle_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Ellipse_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Ellipse_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Ellipse_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr ForeignObject_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr ForeignObject_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr ForeignObject_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr G_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr G_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr G_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Line_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Line_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Line_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Marker_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Marker_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Marker_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Path_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Path_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Path_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Polygon_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Polygon_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Polygon_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Polyline_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Polyline_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Polyline_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Rect_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Rect_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Rect_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Svg_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Svg_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Svg_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Symbol_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Symbol_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Symbol_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Text_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Text_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Text_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr TextPath_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr TextPath_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr TextPath_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Tspan_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Tspan_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Tspan_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Use_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Use_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr Use_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr View_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr View_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This
    { key: "aria-describedby", value: prop' value }
instance Attr View_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr everything AriaDescribedby (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both
    { key: "aria-describedby", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-describedby", value: unset' })
instance Attr everything AriaDescribedby  Unit  where
  attr AriaDescribedby _ = unsafeAttribute $ This
    { key: "aria-describedby", value: unset' }
instance Attr everything AriaDescribedby (Event.Event  Unit ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "aria-describedby", value: unset' }
