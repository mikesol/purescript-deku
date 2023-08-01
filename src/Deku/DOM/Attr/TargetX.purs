module Deku.DOM.Attr.TargetX where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TargetX = TargetX

instance Attr FeConvolveMatrix_ TargetX String where
  attr TargetX bothValues = unsafeAttribute $ Both
    { key: "targetX", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "targetX", value: prop' value })
  pureAttr TargetX value = unsafeAttribute $ This
    { key: "targetX", value: prop' value }
  unpureAttr TargetX eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "targetX", value: prop' value }

instance Attr everything TargetX Unit where
  attr TargetX bothValues = unsafeAttribute $ Both
    { key: "targetX", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "targetX", value: unset' })
  pureAttr TargetX _ = unsafeAttribute $ This { key: "targetX", value: unset' }
  unpureAttr TargetX eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "targetX", value: unset' }
