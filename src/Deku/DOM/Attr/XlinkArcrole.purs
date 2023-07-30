module Deku.DOM.Attr.XlinkArcrole where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkArcrole = XlinkArcrole

instance Attr AnimateTransform_ XlinkArcrole String where
  attr XlinkArcrole bothValues = unsafeAttribute $ Both
    { key: "xlink:arcrole", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
  pureAttr XlinkArcrole value = unsafeAttribute $ This
    { key: "xlink:arcrole", value: prop' value }
  unpureAttr XlinkArcrole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr FeImage_ XlinkArcrole String where
  attr XlinkArcrole bothValues = unsafeAttribute $ Both
    { key: "xlink:arcrole", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
  pureAttr XlinkArcrole value = unsafeAttribute $ This
    { key: "xlink:arcrole", value: prop' value }
  unpureAttr XlinkArcrole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr Filter_ XlinkArcrole String where
  attr XlinkArcrole bothValues = unsafeAttribute $ Both
    { key: "xlink:arcrole", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
  pureAttr XlinkArcrole value = unsafeAttribute $ This
    { key: "xlink:arcrole", value: prop' value }
  unpureAttr XlinkArcrole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr Image_ XlinkArcrole String where
  attr XlinkArcrole bothValues = unsafeAttribute $ Both
    { key: "xlink:arcrole", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
  pureAttr XlinkArcrole value = unsafeAttribute $ This
    { key: "xlink:arcrole", value: prop' value }
  unpureAttr XlinkArcrole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr Mpath_ XlinkArcrole String where
  attr XlinkArcrole bothValues = unsafeAttribute $ Both
    { key: "xlink:arcrole", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:arcrole", value: prop' value })
  pureAttr XlinkArcrole value = unsafeAttribute $ This
    { key: "xlink:arcrole", value: prop' value }
  unpureAttr XlinkArcrole eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }

instance Attr everything XlinkArcrole Unit where
  attr XlinkArcrole bothValues = unsafeAttribute $ Both
    { key: "xlink:arcrole", value: unset' }
    (snd bothValues <#> \_ -> { key: "xlink:arcrole", value: unset' })
  pureAttr XlinkArcrole _ = unsafeAttribute $ This
    { key: "xlink:arcrole", value: unset' }
  unpureAttr XlinkArcrole eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "xlink:arcrole", value: unset' }
