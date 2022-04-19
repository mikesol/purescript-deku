module Deku.DOM.Attr.OnDblclick where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnDblclick = OnDblclick
instance Attr anything OnDblclick Cb where
  attr OnDblclick value = unsafeAttribute { key: "dblclick", value: cb' value }