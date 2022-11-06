module Deku.DOM.Attr.X2 where

import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data X2 = X2

instance Attr Line_ X2 String where
  attr X2 value = unsafeAttribute { key: "x2", value: prop' value }
instance Attr LinearGradient_ X2 String where
  attr X2 value = unsafeAttribute { key: "x2", value: prop' value }