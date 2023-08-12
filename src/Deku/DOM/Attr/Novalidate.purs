module Deku.DOM.Attr.Novalidate where

import Prelude

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Novalidate = Novalidate

instance Attr Form_ Novalidate String where
  attr Novalidate value = unsafeAttribute
    { key: "novalidate", value: prop' value }

instance Attr everything Novalidate Unit where
  attr Novalidate _ = unsafeAttribute
    { key: "novalidate", value: unset' }
