module Deku.DOM.Attr.OnContextmenu where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnContextmenu = OnContextmenu
instance Attr anything OnContextmenu Cb where
  attr OnContextmenu value = unsafeAttribute { key: "contextmenu", value: cb' value }