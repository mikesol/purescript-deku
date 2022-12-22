module Deku.DOM.Attr.XlinkTitle where

import Prelude

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkTitle = XlinkTitle

instance Attr AnimateTransform_ XlinkTitle String where
  attr XlinkTitle value = unsafeAttribute
    { key: "xlink:title", value: prop' value }

instance Attr FeImage_ XlinkTitle String where
  attr XlinkTitle value = unsafeAttribute
    { key: "xlink:title", value: prop' value }

instance Attr Filter_ XlinkTitle String where
  attr XlinkTitle value = unsafeAttribute
    { key: "xlink:title", value: prop' value }

instance Attr Image_ XlinkTitle String where
  attr XlinkTitle value = unsafeAttribute
    { key: "xlink:title", value: prop' value }

instance Attr LinearGradient_ XlinkTitle String where
  attr XlinkTitle value = unsafeAttribute
    { key: "xlink:title", value: prop' value }

instance Attr Mpath_ XlinkTitle String where
  attr XlinkTitle value = unsafeAttribute
    { key: "xlink:title", value: prop' value }

instance Attr Pattern_ XlinkTitle String where
  attr XlinkTitle value = unsafeAttribute
    { key: "xlink:title", value: prop' value }

instance Attr RadialGradient_ XlinkTitle String where
  attr XlinkTitle value = unsafeAttribute
    { key: "xlink:title", value: prop' value }

instance Attr everything XlinkTitle Unit where
  attr XlinkTitle _ = unsafeAttribute
    { key: "xlink:title", value: unset' }
