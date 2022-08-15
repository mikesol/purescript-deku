module Deku.DOM.Attr.OnMouseenter where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnMouseenter = OnMouseenter

instance Attr anything OnMouseenter Cb where
  attr OnMouseenter value = unsafeAttribute
    { key: "mouseenter", value: cb' value }

instance Attr anything OnMouseenter (Effect Unit) where
  attr OnMouseenter value = unsafeAttribute
    { key: "mouseenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseenter (Effect Boolean) where
  attr OnMouseenter value = unsafeAttribute
    { key: "mouseenter", value: cb' (Cb (const value)) }

instance Attr anything OnMouseenter (Zora Unit) where
  attr OnMouseenter value = unsafeAttribute
    { key: "mouseenter", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnMouseenter (Zora Boolean) where
  attr OnMouseenter value = unsafeAttribute
    { key: "mouseenter", value: cb' (Cb (const (runImpure value))) }