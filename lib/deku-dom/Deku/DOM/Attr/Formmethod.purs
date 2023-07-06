module Deku.DOM.Attr.Formmethod where

import Prelude

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formmethod = Formmethod

instance Attr Button_ Formmethod String where
  attr Formmethod value = unsafeAttribute
    { key: "formmethod", value: prop' value }

instance Attr Input_ Formmethod String where
  attr Formmethod value = unsafeAttribute
    { key: "formmethod", value: prop' value }

instance Attr everything Formmethod Unit where
  attr Formmethod _ = unsafeAttribute
    { key: "formmethod", value: unset' }
