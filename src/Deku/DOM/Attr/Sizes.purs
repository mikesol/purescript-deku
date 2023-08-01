module Deku.DOM.Attr.Sizes where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Source (Source_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Sizes = Sizes

instance Attr Link_ Sizes String where
  attr Sizes bothValues = unsafeAttribute $ Both
    { key: "sizes", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "sizes", value: prop' value })
  pureAttr Sizes value = unsafeAttribute $ This
    { key: "sizes", value: prop' value }
  unpureAttr Sizes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "sizes", value: prop' value }

instance Attr Img_ Sizes String where
  attr Sizes bothValues = unsafeAttribute $ Both
    { key: "sizes", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "sizes", value: prop' value })
  pureAttr Sizes value = unsafeAttribute $ This
    { key: "sizes", value: prop' value }
  unpureAttr Sizes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "sizes", value: prop' value }

instance Attr Source_ Sizes String where
  attr Sizes bothValues = unsafeAttribute $ Both
    { key: "sizes", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "sizes", value: prop' value })
  pureAttr Sizes value = unsafeAttribute $ This
    { key: "sizes", value: prop' value }
  unpureAttr Sizes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "sizes", value: prop' value }

instance Attr everything Sizes Unit where
  attr Sizes bothValues = unsafeAttribute $ Both { key: "sizes", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "sizes", value: unset' })
  pureAttr Sizes _ = unsafeAttribute $ This { key: "sizes", value: unset' }
  unpureAttr Sizes eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "sizes", value: unset' }
