module Deku.DOM.Attr.To where

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data To = To

instance Attr Animate_ To String where
  attr To value = unsafeAttribute { key: "to", value: prop' value }

instance Attr AnimateMotion_ To String where
  attr To value = unsafeAttribute { key: "to", value: prop' value }

instance Attr AnimateTransform_ To String where
  attr To value = unsafeAttribute { key: "to", value: prop' value }

instance Attr Set_ To String where
  attr To value = unsafeAttribute { key: "to", value: prop' value }