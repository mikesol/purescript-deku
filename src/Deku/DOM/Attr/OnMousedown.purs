module Deku.DOM.Attr.OnMousedown where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnMousedown = OnMousedown

instance Attr anything OnMousedown Cb where
  attr OnMousedown value = unsafeAttribute
    { key: "mousedown", value: cb' value }

instance Attr anything OnMousedown (Effect Unit) where
  attr OnMousedown value = unsafeAttribute
    { key: "mousedown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousedown (Effect Boolean) where
  attr OnMousedown value = unsafeAttribute
    { key: "mousedown", value: cb' (Cb (const value)) }

instance Attr anything OnMousedown (Zora Unit) where
  attr OnMousedown value = unsafeAttribute
    { key: "mousedown", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnMousedown (Zora Boolean) where
  attr OnMousedown value = unsafeAttribute
    { key: "mousedown", value: cb' (Cb (const (runImpure value))) }