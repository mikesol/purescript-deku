module Deku.DOM.Attr.NumOctaves where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data NumOctaves = NumOctaves

instance Attr FeTurbulence_ NumOctaves String where
  attr NumOctaves bothValues = unsafeAttribute $ Both
    { key: "numOctaves", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "numOctaves", value: prop' value })
  pureAttr NumOctaves value = unsafeAttribute $ This
    { key: "numOctaves", value: prop' value }
  unpureAttr NumOctaves eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "numOctaves", value: prop' value }

instance Attr everything NumOctaves Unit where
  attr NumOctaves bothValues = unsafeAttribute $ Both
    { key: "numOctaves", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "numOctaves", value: unset' })
  pureAttr NumOctaves _ = unsafeAttribute $ This
    { key: "numOctaves", value: unset' }
  unpureAttr NumOctaves eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "numOctaves", value: unset' }
