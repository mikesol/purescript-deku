module Deku.DOM.Attr.OnMousewheel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

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

instance Attr anything OnMousewheel (Zora Unit) where
  attr OnMousewheel value = unsafeAttribute
    { key: "mousewheel  ", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnMousewheel (Zora Boolean) where
  attr OnMousewheel value = unsafeAttribute
    { key: "mousewheel  ", value: cb' (Cb (const (runImpure value))) }