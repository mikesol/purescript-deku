module Deku.DOM.Attr.Formtarget where

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Formtarget = Formtarget

instance Attr Button_ Formtarget String where
  attr Formtarget value = unsafeAttribute
    { key: "formtarget", value: prop' value }

instance Attr Input_ Formtarget String where
  attr Formtarget value = unsafeAttribute
    { key: "formtarget", value: prop' value }
