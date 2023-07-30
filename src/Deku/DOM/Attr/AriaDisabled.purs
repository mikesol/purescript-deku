module Deku.DOM.Attr.AriaDisabled where

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

data AriaDisabled = AriaDisabled

instance Attr Circle_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Ellipse_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr ForeignObject_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr G_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Line_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Marker_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Path_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Polygon_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Polyline_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Rect_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Svg_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Symbol_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Text_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr TextPath_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Tspan_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Use_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr View_ AriaDisabled String where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
  pureAttr AriaDisabled value = unsafeAttribute $ This
    { key: "aria-disabled", value: prop' value }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr everything AriaDisabled Unit where
  attr AriaDisabled bothValues = unsafeAttribute $ Both
    { key: "aria-disabled", value: unset' }
    (snd bothValues <#> \_ -> { key: "aria-disabled", value: unset' })
  pureAttr AriaDisabled _ = unsafeAttribute $ This
    { key: "aria-disabled", value: unset' }
  unpureAttr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-disabled", value: unset' }
