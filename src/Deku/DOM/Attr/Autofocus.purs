module Deku.DOM.Attr.Autofocus where

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Autofocus = Autofocus

instance Attr Button_ Autofocus String where
  attr Autofocus value = unsafeAttribute
    { key: "autofocus", value: prop' value }

instance Attr Input_ Autofocus String where
  attr Autofocus value = unsafeAttribute
    { key: "autofocus", value: prop' value }

instance Attr Select_ Autofocus String where
  attr Autofocus value = unsafeAttribute
    { key: "autofocus", value: prop' value }

instance Attr Textarea_ Autofocus String where
  attr Autofocus value = unsafeAttribute
    { key: "autofocus", value: prop' value }
