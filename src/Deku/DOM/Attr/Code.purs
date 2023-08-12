module Deku.DOM.Attr.Code where

import Prelude

import Deku.DOM.Elt.Applet (Applet_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Code = Code

instance Attr Applet_ Code String where
  attr Code value = unsafeAttribute { key: "code", value: prop' value }

instance Attr everything Code Unit where
  attr Code _ = unsafeAttribute
    { key: "code", value: unset' }
