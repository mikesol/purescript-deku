module Deku.DOM.Attr.OnMousemove where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnMousemove = OnMousemove
instance Attr anything OnMousemove Cb where
  attr OnMousemove value = unsafeAttribute { key: "mousemove", value: cb' value }
instance Attr anything OnMousemove (Effect Unit) where
  attr OnMousemove value = unsafeAttribute { key: "mousemove", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMousemove (Effect Boolean) where
  attr OnMousemove value = unsafeAttribute { key: "mousemove", value: cb' (Cb (const value)) }
instance Attr anything OnMousemove (Zora Unit) where
  attr OnMousemove value = unsafeAttribute { key: "mousemove", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnMousemove (Zora Boolean) where
  attr OnMousemove value = unsafeAttribute { key: "mousemove", value: cb' (Cb (const (runImpure value))) }