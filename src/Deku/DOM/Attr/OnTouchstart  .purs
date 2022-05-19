module Deku.DOM.Attr.OnTouchstart   where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnTouchstart   = OnTouchstart  
instance Attr anything OnTouchstart   Cb where
  attr OnTouchstart   value = unsafeAttribute { key: "touchstart  ", value: cb' value }
instance Attr anything OnTouchstart   (Effect Unit) where
  attr OnTouchstart   value = unsafeAttribute { key: "touchstart  ", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchstart   (Effect Boolean) where
  attr OnTouchstart   value = unsafeAttribute { key: "touchstart  ", value: cb' (Cb (const value)) }