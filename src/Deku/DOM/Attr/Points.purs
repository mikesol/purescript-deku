module Deku.DOM.Attr.Points where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Points = Points

instance Attr Polygon_ Points String where
  attr Points bothValues = unsafeAttribute $ Both
    { key: "points", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "points", value: prop' value })
  pureAttr Points value = unsafeAttribute $ This
    { key: "points", value: prop' value }
  unpureAttr Points eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "points", value: prop' value }

instance Attr Polyline_ Points String where
  attr Points bothValues = unsafeAttribute $ Both
    { key: "points", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "points", value: prop' value })
  pureAttr Points value = unsafeAttribute $ This
    { key: "points", value: prop' value }
  unpureAttr Points eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "points", value: prop' value }

instance Attr everything Points Unit where
  attr Points bothValues = unsafeAttribute $ Both
    { key: "points", value: unset' }
    (snd bothValues <#> \_ -> { key: "points", value: unset' })
  pureAttr Points _ = unsafeAttribute $ This { key: "points", value: unset' }
  unpureAttr Points eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "points", value: unset' }
