module Deku.DOM.Attr.EdgeMode where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data EdgeMode = EdgeMode

instance Attr FeConvolveMatrix_ EdgeMode String where
  attr EdgeMode bothValues = unsafeAttribute $ Both
    { key: "edgeMode", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "edgeMode", value: prop' value })
  pureAttr EdgeMode value = unsafeAttribute $ This
    { key: "edgeMode", value: prop' value }
  unpureAttr EdgeMode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "edgeMode", value: prop' value }

instance Attr FeGaussianBlur_ EdgeMode String where
  attr EdgeMode bothValues = unsafeAttribute $ Both
    { key: "edgeMode", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "edgeMode", value: prop' value })
  pureAttr EdgeMode value = unsafeAttribute $ This
    { key: "edgeMode", value: prop' value }
  unpureAttr EdgeMode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "edgeMode", value: prop' value }

instance Attr everything EdgeMode Unit where
  attr EdgeMode bothValues = unsafeAttribute $ Both
    { key: "edgeMode", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "edgeMode", value: unset' })
  pureAttr EdgeMode _ = unsafeAttribute $ This
    { key: "edgeMode", value: unset' }
  unpureAttr EdgeMode eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "edgeMode", value: unset' }
