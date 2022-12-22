module Deku.DOM.Attr.Min where

import Prelude

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Min = Min

instance Attr Input_ Min String where
  attr Min value = unsafeAttribute { key: "min", value: prop' value }

instance Attr Meter_ Min String where
  attr Min value = unsafeAttribute { key: "min", value: prop' value }

instance Attr Animate_ Min String where
  attr Min value = unsafeAttribute { key: "min", value: prop' value }

instance Attr AnimateMotion_ Min String where
  attr Min value = unsafeAttribute { key: "min", value: prop' value }

instance Attr AnimateTransform_ Min String where
  attr Min value = unsafeAttribute { key: "min", value: prop' value }

instance Attr Set_ Min String where
  attr Min value = unsafeAttribute { key: "min", value: prop' value }

instance Attr everything Min Unit where
  attr Min _ = unsafeAttribute
    { key: "min", value: unset' }
