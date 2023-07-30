module Deku.DOM.Attr.AriaValuenow where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

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

data AriaValuenow = AriaValuenow

instance Attr Circle_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr Ellipse_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr ForeignObject_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr G_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr Line_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr Marker_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr Path_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr Polygon_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr Polyline_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr Rect_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr Svg_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr Symbol_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr Text_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr TextPath_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr Tspan_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr Use_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr View_ AriaValuenow String where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-valuenow", value: prop' value })
  pureAttr AriaValuenow value = unsafeAttribute $ This
    { key: "aria-valuenow", value: prop' value }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }

instance Attr everything AriaValuenow Unit where
  attr AriaValuenow bothValues = unsafeAttribute $ Both
    { key: "aria-valuenow", value: unset' }
    (snd bothValues <#> \_ -> { key: "aria-valuenow", value: unset' })
  pureAttr AriaValuenow _ = unsafeAttribute $ This
    { key: "aria-valuenow", value: unset' }
  unpureAttr AriaValuenow eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-valuenow", value: unset' }
