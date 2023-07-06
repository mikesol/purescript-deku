module Deku.DOM.Attr.Autocomplete where

import Prelude

import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Autocomplete = Autocomplete

instance Attr Form_ Autocomplete String where
  attr Autocomplete value = unsafeAttribute
    { key: "autocomplete", value: prop' value }

instance Attr Input_ Autocomplete String where
  attr Autocomplete value = unsafeAttribute
    { key: "autocomplete", value: prop' value }

instance Attr Select_ Autocomplete String where
  attr Autocomplete value = unsafeAttribute
    { key: "autocomplete", value: prop' value }

instance Attr Textarea_ Autocomplete String where
  attr Autocomplete value = unsafeAttribute
    { key: "autocomplete", value: prop' value }

instance Attr everything Autocomplete Unit where
  attr Autocomplete _ = unsafeAttribute
    { key: "autocomplete", value: unset' }
