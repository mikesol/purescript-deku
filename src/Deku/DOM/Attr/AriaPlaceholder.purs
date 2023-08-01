module Deku.DOM.Attr.AriaPlaceholder where

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

data AriaPlaceholder = AriaPlaceholder

instance Attr Circle_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Ellipse_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr ForeignObject_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr G_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Line_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Marker_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Path_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Polygon_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Polyline_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Rect_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Svg_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Symbol_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Text_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr TextPath_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Tspan_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr Use_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr View_ AriaPlaceholder String where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-placeholder", value: prop' value }
    )
  pureAttr AriaPlaceholder value = unsafeAttribute $ This
    { key: "aria-placeholder", value: prop' value }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-placeholder", value: prop' value }

instance Attr everything AriaPlaceholder Unit where
  attr AriaPlaceholder bothValues = unsafeAttribute $ Both
    { key: "aria-placeholder", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-placeholder", value: unset' })
  pureAttr AriaPlaceholder _ = unsafeAttribute $ This
    { key: "aria-placeholder", value: unset' }
  unpureAttr AriaPlaceholder eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "aria-placeholder", value: unset' }
