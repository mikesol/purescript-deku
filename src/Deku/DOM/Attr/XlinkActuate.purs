module Deku.DOM.Attr.XlinkActuate where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkActuate = XlinkActuate

instance Attr AnimateTransform_ XlinkActuate String where
  attr XlinkActuate bothValues = unsafeAttribute $ Both
    { key: "xlink:actuate", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
  pureAttr XlinkActuate value = unsafeAttribute $ This
    { key: "xlink:actuate", value: prop' value }
  unpureAttr XlinkActuate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr FeImage_ XlinkActuate String where
  attr XlinkActuate bothValues = unsafeAttribute $ Both
    { key: "xlink:actuate", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
  pureAttr XlinkActuate value = unsafeAttribute $ This
    { key: "xlink:actuate", value: prop' value }
  unpureAttr XlinkActuate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr Filter_ XlinkActuate String where
  attr XlinkActuate bothValues = unsafeAttribute $ Both
    { key: "xlink:actuate", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
  pureAttr XlinkActuate value = unsafeAttribute $ This
    { key: "xlink:actuate", value: prop' value }
  unpureAttr XlinkActuate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr Image_ XlinkActuate String where
  attr XlinkActuate bothValues = unsafeAttribute $ Both
    { key: "xlink:actuate", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
  pureAttr XlinkActuate value = unsafeAttribute $ This
    { key: "xlink:actuate", value: prop' value }
  unpureAttr XlinkActuate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr Mpath_ XlinkActuate String where
  attr XlinkActuate bothValues = unsafeAttribute $ Both
    { key: "xlink:actuate", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
  pureAttr XlinkActuate value = unsafeAttribute $ This
    { key: "xlink:actuate", value: prop' value }
  unpureAttr XlinkActuate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr everything XlinkActuate Unit where
  attr XlinkActuate bothValues = unsafeAttribute $ Both
    { key: "xlink:actuate", value: unset' }
    (snd bothValues <#> \_ -> { key: "xlink:actuate", value: unset' })
  pureAttr XlinkActuate _ = unsafeAttribute $ This
    { key: "xlink:actuate", value: unset' }
  unpureAttr XlinkActuate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "xlink:actuate", value: unset' }
