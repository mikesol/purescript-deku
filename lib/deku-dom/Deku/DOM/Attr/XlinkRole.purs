module Deku.DOM.Attr.XlinkRole where

import Prelude

import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkRole = XlinkRole

instance Attr AnimateTransform_ XlinkRole String where
  attr XlinkRole value = unsafeAttribute
    { key: "xlink:role", value: prop' value }

instance Attr FeImage_ XlinkRole String where
  attr XlinkRole value = unsafeAttribute
    { key: "xlink:role", value: prop' value }

instance Attr Filter_ XlinkRole String where
  attr XlinkRole value = unsafeAttribute
    { key: "xlink:role", value: prop' value }

instance Attr Image_ XlinkRole String where
  attr XlinkRole value = unsafeAttribute
    { key: "xlink:role", value: prop' value }

instance Attr Mpath_ XlinkRole String where
  attr XlinkRole value = unsafeAttribute
    { key: "xlink:role", value: prop' value }

instance Attr everything XlinkRole Unit where
  attr XlinkRole _ = unsafeAttribute
    { key: "xlink:role", value: unset' }
