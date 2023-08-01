module Deku.DOM.Attr.Coords where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Coords = Coords

instance Attr Area_ Coords String where
  attr Coords bothValues = unsafeAttribute $ Both
    { key: "coords", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "coords", value: prop' value })
  pureAttr Coords value = unsafeAttribute $ This
    { key: "coords", value: prop' value }
  unpureAttr Coords eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "coords", value: prop' value }

instance Attr everything Coords Unit where
  attr Coords bothValues = unsafeAttribute $ Both
    { key: "coords", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "coords", value: unset' })
  pureAttr Coords _ = unsafeAttribute $ This { key: "coords", value: unset' }
  unpureAttr Coords eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "coords", value: unset' }
