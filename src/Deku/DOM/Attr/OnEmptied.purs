module Deku.DOM.Attr.OnEmptied where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnEmptied = OnEmptied
instance Attr anything OnEmptied Cb where
  attr OnEmptied value = unsafeAttribute { key: "emptied", value: cb' value }