module Deku.DOM.Attr.XlinkHref where

import Prelude

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkHref = XlinkHref

instance Attr AnimateTransform_ XlinkHref String where
  attr XlinkHref value = unsafeAttribute
    { key: "xlink:href", value: prop' value }

instance Attr FeImage_ XlinkHref String where
  attr XlinkHref value = unsafeAttribute
    { key: "xlink:href", value: prop' value }

instance Attr Filter_ XlinkHref String where
  attr XlinkHref value = unsafeAttribute
    { key: "xlink:href", value: prop' value }

instance Attr Image_ XlinkHref String where
  attr XlinkHref value = unsafeAttribute
    { key: "xlink:href", value: prop' value }

instance Attr LinearGradient_ XlinkHref String where
  attr XlinkHref value = unsafeAttribute
    { key: "xlink:href", value: prop' value }

instance Attr Mpath_ XlinkHref String where
  attr XlinkHref value = unsafeAttribute
    { key: "xlink:href", value: prop' value }

instance Attr Pattern_ XlinkHref String where
  attr XlinkHref value = unsafeAttribute
    { key: "xlink:href", value: prop' value }

instance Attr RadialGradient_ XlinkHref String where
  attr XlinkHref value = unsafeAttribute
    { key: "xlink:href", value: prop' value }

instance Attr Use_ XlinkHref String where
  attr XlinkHref value = unsafeAttribute
    { key: "xlink:href", value: prop' value }

instance Attr everything XlinkHref Unit where
  attr XlinkHref _ = unsafeAttribute
    { key: "xlink:href", value: unset' }
