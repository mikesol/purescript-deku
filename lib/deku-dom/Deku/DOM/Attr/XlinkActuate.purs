module Deku.DOM.Attr.XlinkActuate where

import Prelude

import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkActuate = XlinkActuate

instance Attr AnimateTransform_ XlinkActuate String where
  attr XlinkActuate value = unsafeAttribute
    { key: "xlink:actuate", value: prop' value }

instance Attr FeImage_ XlinkActuate String where
  attr XlinkActuate value = unsafeAttribute
    { key: "xlink:actuate", value: prop' value }

instance Attr Filter_ XlinkActuate String where
  attr XlinkActuate value = unsafeAttribute
    { key: "xlink:actuate", value: prop' value }

instance Attr Image_ XlinkActuate String where
  attr XlinkActuate value = unsafeAttribute
    { key: "xlink:actuate", value: prop' value }

instance Attr Mpath_ XlinkActuate String where
  attr XlinkActuate value = unsafeAttribute
    { key: "xlink:actuate", value: prop' value }

instance Attr everything XlinkActuate Unit where
  attr XlinkActuate _ = unsafeAttribute
    { key: "xlink:actuate", value: unset' }
