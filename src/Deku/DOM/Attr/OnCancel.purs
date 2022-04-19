module Deku.DOM.Attr.OnCancel where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnCancel = OnCancel
instance Attr anything OnCancel Cb where
  attr OnCancel value = unsafeAttribute { key: "cancel", value: cb' value }