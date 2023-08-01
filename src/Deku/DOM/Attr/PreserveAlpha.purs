module Deku.DOM.Attr.PreserveAlpha where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PreserveAlpha = PreserveAlpha

instance Attr FeConvolveMatrix_ PreserveAlpha String where
  attr PreserveAlpha bothValues = unsafeAttribute $ Both
    { key: "preserveAlpha", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "preserveAlpha", value: prop' value })
  pureAttr PreserveAlpha value = unsafeAttribute $ This
    { key: "preserveAlpha", value: prop' value }
  unpureAttr PreserveAlpha eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "preserveAlpha", value: prop' value }

instance Attr everything PreserveAlpha Unit where
  attr PreserveAlpha bothValues = unsafeAttribute $ Both
    { key: "preserveAlpha", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "preserveAlpha", value: unset' })
  pureAttr PreserveAlpha _ = unsafeAttribute $ This
    { key: "preserveAlpha", value: unset' }
  unpureAttr PreserveAlpha eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "preserveAlpha", value: unset' }
