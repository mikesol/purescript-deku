module Deku.DOM.Attr.OnMousewheel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnMousewheel = OnMousewheel

instance Attr anything OnMousewheel Cb where
  attr OnMousewheel value = unsafeAttribute
    { key: "mousewheel  ", value: cb' value }

instance Attr anything OnMousewheel (Effect Unit) where
  attr OnMousewheel value = unsafeAttribute
    { key: "mousewheel  ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousewheel (Effect Boolean) where
  attr OnMousewheel value = unsafeAttribute
    { key: "mousewheel  ", value: cb' (Cb (const value)) }