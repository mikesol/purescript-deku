module Deku.DOM.Attr.Order where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Order = Order

instance Attr FeConvolveMatrix_ Order String where
  attr Order bothValues = unsafeAttribute $ Both
    { key: "order", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "order", value: prop' value })
  pureAttr Order value = unsafeAttribute $ This
    { key: "order", value: prop' value }
  unpureAttr Order eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "order", value: prop' value }

instance Attr everything Order Unit where
  attr Order bothValues = unsafeAttribute $ Both { key: "order", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "order", value: unset' })
  pureAttr Order _ = unsafeAttribute $ This { key: "order", value: unset' }
  unpureAttr Order eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "order", value: unset' }
