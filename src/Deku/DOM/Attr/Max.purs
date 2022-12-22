module Deku.DOM.Attr.Max where

import Prelude

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Progress (Progress_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Max = Max

instance Attr Input_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }

instance Attr Meter_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }

instance Attr Progress_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }

instance Attr Animate_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }

instance Attr AnimateMotion_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }

instance Attr AnimateTransform_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }

instance Attr Set_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }

instance Attr everything Max Unit where
  attr Max _ = unsafeAttribute
    { key: "max", value: unset' }
