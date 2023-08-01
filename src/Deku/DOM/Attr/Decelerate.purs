module Deku.DOM.Attr.Decelerate where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Decelerate = Decelerate

instance Attr AnimateTransform_ Decelerate String where
  attr Decelerate bothValues = unsafeAttribute $ Both
    { key: "decelerate", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "decelerate", value: prop' value })
  pureAttr Decelerate value = unsafeAttribute $ This
    { key: "decelerate", value: prop' value }
  unpureAttr Decelerate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "decelerate", value: prop' value }

instance Attr everything Decelerate Unit where
  attr Decelerate bothValues = unsafeAttribute $ Both
    { key: "decelerate", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "decelerate", value: unset' })
  pureAttr Decelerate _ = unsafeAttribute $ This
    { key: "decelerate", value: unset' }
  unpureAttr Decelerate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "decelerate", value: unset' }
