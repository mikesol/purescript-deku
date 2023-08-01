module Deku.DOM.Attr.ViewBox where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ViewBox = ViewBox

instance Attr Marker_ ViewBox String where
  attr ViewBox bothValues = unsafeAttribute $ Both
    { key: "viewBox", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "viewBox", value: prop' value })
  pureAttr ViewBox value = unsafeAttribute $ This
    { key: "viewBox", value: prop' value }
  unpureAttr ViewBox eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }

instance Attr Pattern_ ViewBox String where
  attr ViewBox bothValues = unsafeAttribute $ Both
    { key: "viewBox", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "viewBox", value: prop' value })
  pureAttr ViewBox value = unsafeAttribute $ This
    { key: "viewBox", value: prop' value }
  unpureAttr ViewBox eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }

instance Attr Svg_ ViewBox String where
  attr ViewBox bothValues = unsafeAttribute $ Both
    { key: "viewBox", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "viewBox", value: prop' value })
  pureAttr ViewBox value = unsafeAttribute $ This
    { key: "viewBox", value: prop' value }
  unpureAttr ViewBox eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }

instance Attr Symbol_ ViewBox String where
  attr ViewBox bothValues = unsafeAttribute $ Both
    { key: "viewBox", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "viewBox", value: prop' value })
  pureAttr ViewBox value = unsafeAttribute $ This
    { key: "viewBox", value: prop' value }
  unpureAttr ViewBox eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }

instance Attr View_ ViewBox String where
  attr ViewBox bothValues = unsafeAttribute $ Both
    { key: "viewBox", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "viewBox", value: prop' value })
  pureAttr ViewBox value = unsafeAttribute $ This
    { key: "viewBox", value: prop' value }
  unpureAttr ViewBox eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }

instance Attr everything ViewBox Unit where
  attr ViewBox bothValues = unsafeAttribute $ Both
    { key: "viewBox", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "viewBox", value: unset' })
  pureAttr ViewBox _ = unsafeAttribute $ This { key: "viewBox", value: unset' }
  unpureAttr ViewBox eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "viewBox", value: unset' }
