module Deku.DOM.Attr.OnMouseup where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnMouseup = OnMouseup

instance Attr anything OnMouseup Cb where
  attr OnMouseup value = unsafeAttribute { key: "mouseup", value: cb' value }

instance Attr anything OnMouseup (Effect Unit) where
  attr OnMouseup value = unsafeAttribute
    { key: "mouseup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseup (Effect Boolean) where
  attr OnMouseup value = unsafeAttribute
    { key: "mouseup", value: cb' (Cb (const value)) }

instance Attr anything OnMouseup (Zora Unit) where
  attr OnMouseup value = unsafeAttribute
    { key: "mouseup", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnMouseup (Zora Boolean) where
  attr OnMouseup value = unsafeAttribute
    { key: "mouseup", value: cb' (Cb (const (runImpure value))) }