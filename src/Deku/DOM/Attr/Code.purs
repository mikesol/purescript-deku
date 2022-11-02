module Deku.DOM.Attr.Code where

import Deku.DOM.Elt.Applet (Applet_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Code = Code

instance Attr Applet_ Code String where
  attr Code value = unsafeAttribute { key: "code", value: prop' value }
