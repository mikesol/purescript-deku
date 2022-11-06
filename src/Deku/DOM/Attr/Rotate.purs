module Deku.DOM.Attr.Rotate where

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Rotate = Rotate

instance Attr AnimateMotion_ Rotate String where
  attr Rotate value = unsafeAttribute { key: "rotate", value: prop' value }

instance Attr Text_ Rotate String where
  attr Rotate value = unsafeAttribute { key: "rotate", value: prop' value }

instance Attr Tspan_ Rotate String where
  attr Rotate value = unsafeAttribute { key: "rotate", value: prop' value }