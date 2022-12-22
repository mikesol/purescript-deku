module Deku.DOM.Attr.Rotate where

import Prelude

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rotate = Rotate

instance Attr AnimateMotion_ Rotate String where
  attr Rotate value = unsafeAttribute { key: "rotate", value: prop' value }

instance Attr Text_ Rotate String where
  attr Rotate value = unsafeAttribute { key: "rotate", value: prop' value }

instance Attr Tspan_ Rotate String where
  attr Rotate value = unsafeAttribute { key: "rotate", value: prop' value }

instance Attr everything Rotate Unit where
  attr Rotate _ = unsafeAttribute
    { key: "rotate", value: unset' }
