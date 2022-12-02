module Deku.DOM.Attr.OnMouseover where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute)
import FRP.Event (Event)

data OnMouseover = OnMouseover

instance Attr anything OnMouseover Cb where
  attr OnMouseover value = unsafeAttribute
    { key: "mouseover", value: cb' value }

instance Attr anything OnMouseover (Effect Unit) where
  attr OnMouseover value = unsafeAttribute
    { key: "mouseover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseover (Effect Boolean) where
  attr OnMouseover value = unsafeAttribute
    { key: "mouseover", value: cb' (Cb (const value)) }

type OnMouseoverEffect = forall element. Attr element OnMouseover (Effect Unit) => Event (Attribute element)
