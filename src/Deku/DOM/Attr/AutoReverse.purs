module Deku.DOM.Attr.AutoReverse where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AutoReverse = AutoReverse

instance Attr AnimateTransform_ AutoReverse String where
  attr AutoReverse bothValues = unsafeAttribute $ Both
    { key: "autoReverse", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "autoReverse", value: prop' value })
  pureAttr AutoReverse value = unsafeAttribute $ This
    { key: "autoReverse", value: prop' value }
  unpureAttr AutoReverse eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autoReverse", value: prop' value }

instance Attr everything AutoReverse Unit where
  attr AutoReverse bothValues = unsafeAttribute $ Both
    { key: "autoReverse", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "autoReverse", value: unset' })
  pureAttr AutoReverse _ = unsafeAttribute $ This
    { key: "autoReverse", value: unset' }
  unpureAttr AutoReverse eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "autoReverse", value: unset' }
