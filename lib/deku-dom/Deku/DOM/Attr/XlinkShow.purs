module Deku.DOM.Attr.XlinkShow where

import Prelude

import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkShow = XlinkShow

instance Attr AnimateTransform_ XlinkShow String where
  attr XlinkShow value = unsafeAttribute
    { key: "xlink:show", value: prop' value }

instance Attr FeImage_ XlinkShow String where
  attr XlinkShow value = unsafeAttribute
    { key: "xlink:show", value: prop' value }

instance Attr Filter_ XlinkShow String where
  attr XlinkShow value = unsafeAttribute
    { key: "xlink:show", value: prop' value }

instance Attr Image_ XlinkShow String where
  attr XlinkShow value = unsafeAttribute
    { key: "xlink:show", value: prop' value }

instance Attr Mpath_ XlinkShow String where
  attr XlinkShow value = unsafeAttribute
    { key: "xlink:show", value: prop' value }

instance Attr everything XlinkShow Unit where
  attr XlinkShow _ = unsafeAttribute
    { key: "xlink:show", value: unset' }
