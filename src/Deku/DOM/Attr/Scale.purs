module Deku.DOM.Attr.Scale where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scale = Scale

instance Attr FeDisplacementMap_ Scale String where
  attr Scale bothValues = unsafeAttribute $ Both
    { key: "scale", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "scale", value: prop' value })
  pureAttr Scale value = unsafeAttribute $ This
    { key: "scale", value: prop' value }
  unpureAttr Scale eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scale", value: prop' value }

instance Attr everything Scale Unit where
  attr Scale bothValues = unsafeAttribute $ Both { key: "scale", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "scale", value: unset' })
  pureAttr Scale _ = unsafeAttribute $ This { key: "scale", value: unset' }
  unpureAttr Scale eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "scale", value: unset' }
