module Deku.DOM.Attr.AriaPressed where

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

data AriaPressed = AriaPressed

instance Attr Circle_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Ellipse_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr ForeignObject_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr G_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Line_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Marker_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Path_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Polygon_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Polyline_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Rect_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Svg_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Symbol_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Text_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr TextPath_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Tspan_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Use_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr View_ AriaPressed String where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
  pureAttr AriaPressed value = unsafeAttribute $ This
    { key: "aria-pressed", value: prop' value }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr everything AriaPressed Unit where
  attr AriaPressed bothValues = unsafeAttribute $ Both
    { key: "aria-pressed", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-pressed", value: unset' })
  pureAttr AriaPressed _ = unsafeAttribute $ This
    { key: "aria-pressed", value: unset' }
  unpureAttr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-pressed", value: unset' }
