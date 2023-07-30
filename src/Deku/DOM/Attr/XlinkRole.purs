module Deku.DOM.Attr.XlinkRole where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkRole = XlinkRole

instance Attr AnimateTransform_ XlinkRole String where
  attr XlinkRole bothValues = unsafeAttribute $ Both
    { key: "xlink:role", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:role", value: prop' value })
  pureAttr XlinkRole value = unsafeAttribute $ This
    { key: "xlink:role", value: prop' value }
  unpureAttr XlinkRole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:role", value: prop' value }

instance Attr FeImage_ XlinkRole String where
  attr XlinkRole bothValues = unsafeAttribute $ Both
    { key: "xlink:role", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:role", value: prop' value })
  pureAttr XlinkRole value = unsafeAttribute $ This
    { key: "xlink:role", value: prop' value }
  unpureAttr XlinkRole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:role", value: prop' value }

instance Attr Filter_ XlinkRole String where
  attr XlinkRole bothValues = unsafeAttribute $ Both
    { key: "xlink:role", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:role", value: prop' value })
  pureAttr XlinkRole value = unsafeAttribute $ This
    { key: "xlink:role", value: prop' value }
  unpureAttr XlinkRole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:role", value: prop' value }

instance Attr Image_ XlinkRole String where
  attr XlinkRole bothValues = unsafeAttribute $ Both
    { key: "xlink:role", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:role", value: prop' value })
  pureAttr XlinkRole value = unsafeAttribute $ This
    { key: "xlink:role", value: prop' value }
  unpureAttr XlinkRole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:role", value: prop' value }

instance Attr Mpath_ XlinkRole String where
  attr XlinkRole bothValues = unsafeAttribute $ Both
    { key: "xlink:role", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:role", value: prop' value })
  pureAttr XlinkRole value = unsafeAttribute $ This
    { key: "xlink:role", value: prop' value }
  unpureAttr XlinkRole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:role", value: prop' value }

instance Attr everything XlinkRole Unit where
  attr XlinkRole bothValues = unsafeAttribute $ Both
    { key: "xlink:role", value: unset' }
    (snd bothValues <#> \_ -> { key: "xlink:role", value: unset' })
  pureAttr XlinkRole _ = unsafeAttribute $ This
    { key: "xlink:role", value: unset' }
  unpureAttr XlinkRole eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "xlink:role", value: unset' }
