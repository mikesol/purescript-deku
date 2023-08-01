module Deku.DOM.Attr.XlinkType where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkType = XlinkType

instance Attr AnimateTransform_ XlinkType String where
  attr XlinkType bothValues = unsafeAttribute $ Both
    { key: "xlink:type", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:type", value: prop' value })
  pureAttr XlinkType value = unsafeAttribute $ This
    { key: "xlink:type", value: prop' value }
  unpureAttr XlinkType eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr FeImage_ XlinkType String where
  attr XlinkType bothValues = unsafeAttribute $ Both
    { key: "xlink:type", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:type", value: prop' value })
  pureAttr XlinkType value = unsafeAttribute $ This
    { key: "xlink:type", value: prop' value }
  unpureAttr XlinkType eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr Filter_ XlinkType String where
  attr XlinkType bothValues = unsafeAttribute $ Both
    { key: "xlink:type", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:type", value: prop' value })
  pureAttr XlinkType value = unsafeAttribute $ This
    { key: "xlink:type", value: prop' value }
  unpureAttr XlinkType eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr Image_ XlinkType String where
  attr XlinkType bothValues = unsafeAttribute $ Both
    { key: "xlink:type", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:type", value: prop' value })
  pureAttr XlinkType value = unsafeAttribute $ This
    { key: "xlink:type", value: prop' value }
  unpureAttr XlinkType eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr Mpath_ XlinkType String where
  attr XlinkType bothValues = unsafeAttribute $ Both
    { key: "xlink:type", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:type", value: prop' value })
  pureAttr XlinkType value = unsafeAttribute $ This
    { key: "xlink:type", value: prop' value }
  unpureAttr XlinkType eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }

instance Attr everything XlinkType Unit where
  attr XlinkType bothValues = unsafeAttribute $ Both
    { key: "xlink:type", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "xlink:type", value: unset' })
  pureAttr XlinkType _ = unsafeAttribute $ This
    { key: "xlink:type", value: unset' }
  unpureAttr XlinkType eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "xlink:type", value: unset' }
