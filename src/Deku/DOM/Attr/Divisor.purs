module Deku.DOM.Attr.Divisor where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Divisor = Divisor

instance Attr FeConvolveMatrix_ Divisor String where
  attr Divisor bothValues = unsafeAttribute $ Both
    { key: "divisor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "divisor", value: prop' value })
  pureAttr Divisor value = unsafeAttribute $ This
    { key: "divisor", value: prop' value }
  unpureAttr Divisor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "divisor", value: prop' value }

instance Attr everything Divisor Unit where
  attr Divisor bothValues = unsafeAttribute $ Both
    { key: "divisor", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "divisor", value: unset' })
  pureAttr Divisor _ = unsafeAttribute $ This { key: "divisor", value: unset' }
  unpureAttr Divisor eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "divisor", value: unset' }
