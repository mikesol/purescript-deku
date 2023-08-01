module Deku.DOM.Attr.Usemap where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Usemap = Usemap

instance Attr Img_ Usemap String where
  attr Usemap bothValues = unsafeAttribute $ Both
    { key: "usemap", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "usemap", value: prop' value })
  pureAttr Usemap value = unsafeAttribute $ This
    { key: "usemap", value: prop' value }
  unpureAttr Usemap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "usemap", value: prop' value }

instance Attr Input_ Usemap String where
  attr Usemap bothValues = unsafeAttribute $ Both
    { key: "usemap", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "usemap", value: prop' value })
  pureAttr Usemap value = unsafeAttribute $ This
    { key: "usemap", value: prop' value }
  unpureAttr Usemap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "usemap", value: prop' value }

instance Attr Object_ Usemap String where
  attr Usemap bothValues = unsafeAttribute $ Both
    { key: "usemap", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "usemap", value: prop' value })
  pureAttr Usemap value = unsafeAttribute $ This
    { key: "usemap", value: prop' value }
  unpureAttr Usemap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "usemap", value: prop' value }

instance Attr everything Usemap Unit where
  attr Usemap bothValues = unsafeAttribute $ Both
    { key: "usemap", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "usemap", value: unset' })
  pureAttr Usemap _ = unsafeAttribute $ This { key: "usemap", value: unset' }
  unpureAttr Usemap eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "usemap", value: unset' }
