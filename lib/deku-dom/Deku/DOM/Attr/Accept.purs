module Deku.DOM.Attr.Accept where

import Prelude

import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accept = Accept

instance Attr Form_ Accept String where
  attr Accept value = unsafeAttribute { key: "accept", value: prop' value }

instance Attr Input_ Accept String where
  attr Accept value = unsafeAttribute { key: "accept", value: prop' value }

instance Attr everything Accept Unit where
  attr Accept _ = unsafeAttribute
    { key: "accept", value: unset' }
