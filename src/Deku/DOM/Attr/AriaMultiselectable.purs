module Deku.DOM.Attr.AriaMultiselectable where

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

data AriaMultiselectable = AriaMultiselectable

instance Attr Circle_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Circle_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Circle_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr Ellipse_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Ellipse_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Ellipse_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr ForeignObject_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr ForeignObject_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr ForeignObject_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr G_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr G_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr G_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr Line_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Line_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Line_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr Marker_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Marker_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Marker_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr Path_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Path_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Path_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr Polygon_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Polygon_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Polygon_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr Polyline_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Polyline_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Polyline_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr Rect_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Rect_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Rect_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr Svg_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Svg_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Svg_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr Symbol_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Symbol_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Symbol_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr Text_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Text_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Text_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr TextPath_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr TextPath_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr TextPath_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr Tspan_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Tspan_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Tspan_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr Use_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr Use_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr Use_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr View_ AriaMultiselectable (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-multiselectable", value: prop' value }
    )
instance Attr View_ AriaMultiselectable  String  where
  attr AriaMultiselectable value = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: prop' value }
instance Attr View_ AriaMultiselectable (Event.Event  String ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-multiselectable", value: prop' value }

instance Attr everything AriaMultiselectable (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaMultiselectable bothValues = unsafeAttribute $ Both
    { key: "aria-multiselectable", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-multiselectable", value: unset' })
instance Attr everything AriaMultiselectable  Unit  where
  attr AriaMultiselectable _ = unsafeAttribute $ This $ pure $
    { key: "aria-multiselectable", value: unset' }
instance Attr everything AriaMultiselectable (Event.Event  Unit ) where
  attr AriaMultiselectable eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "aria-multiselectable", value: unset' }
