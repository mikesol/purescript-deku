module Deku.DOM.Attr.Checked where

import Prelude

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Checked = Checked

instance Attr Input_ Checked String where
  attr Checked value = unsafeAttribute { key: "checked", value: prop' value }

instance Attr everything Checked Unit where
  attr Checked _ = unsafeAttribute
    { key: "checked", value: unset' }
