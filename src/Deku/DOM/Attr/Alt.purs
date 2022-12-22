module Deku.DOM.Attr.Alt where

import Prelude

import Deku.DOM.Elt.Applet (Applet_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Alt = Alt

instance Attr Applet_ Alt String where
  attr Alt value = unsafeAttribute { key: "alt", value: prop' value }

instance Attr Area_ Alt String where
  attr Alt value = unsafeAttribute { key: "alt", value: prop' value }

instance Attr Img_ Alt String where
  attr Alt value = unsafeAttribute { key: "alt", value: prop' value }

instance Attr Input_ Alt String where
  attr Alt value = unsafeAttribute { key: "alt", value: prop' value }

instance Attr everything Alt Unit where
  attr Alt _ = unsafeAttribute
    { key: "alt", value: unset' }
