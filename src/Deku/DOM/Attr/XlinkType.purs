module Deku.DOM.Attr.XlinkType where

import Prelude

import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkType = XlinkType

instance Attr AnimateTransform_ XlinkType String where
  attr XlinkType value = unsafeAttribute
    { key: "xlink:type", value: prop' value }

instance Attr FeImage_ XlinkType String where
  attr XlinkType value = unsafeAttribute
    { key: "xlink:type", value: prop' value }

instance Attr Filter_ XlinkType String where
  attr XlinkType value = unsafeAttribute
    { key: "xlink:type", value: prop' value }

instance Attr Image_ XlinkType String where
  attr XlinkType value = unsafeAttribute
    { key: "xlink:type", value: prop' value }

instance Attr Mpath_ XlinkType String where
  attr XlinkType value = unsafeAttribute
    { key: "xlink:type", value: prop' value }

instance Attr everything XlinkType Unit where
  attr XlinkType _ = unsafeAttribute
    { key: "xlink:type", value: unset' }
