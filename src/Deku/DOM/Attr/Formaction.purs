module Deku.DOM.Attr.Formaction where

import Prelude

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Button (Button_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formaction = Formaction

instance Attr Input_ Formaction String where
  attr Formaction value = unsafeAttribute
    { key: "formaction", value: prop' value }

instance Attr Button_ Formaction String where
  attr Formaction value = unsafeAttribute
    { key: "formaction", value: prop' value }

instance Attr everything Formaction Unit where
  attr Formaction _ = unsafeAttribute
    { key: "formaction", value: unset' }
