module Deku.DOM.Attr.AriaErrormessage where

import Prelude
import Data.These (These(..))
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

data AriaErrormessage = AriaErrormessage

instance Attr Circle_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Ellipse_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr ForeignObject_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr G_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Line_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Marker_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Path_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Polygon_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Polyline_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Rect_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Svg_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Symbol_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Text_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr TextPath_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Tspan_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Use_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr View_ AriaErrormessage String where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
  pureAttr AriaErrormessage value = unsafeAttribute $ This
    { key: "aria-errormessage", value: prop' value }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr everything AriaErrormessage Unit where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both
    { key: "aria-errormessage", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-errormessage", value: unset' })
  pureAttr AriaErrormessage _ = unsafeAttribute $ This
    { key: "aria-errormessage", value: unset' }
  unpureAttr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "aria-errormessage", value: unset' }
