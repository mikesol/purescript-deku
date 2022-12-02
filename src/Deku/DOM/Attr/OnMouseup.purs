module Deku.DOM.Attr.OnMouseup where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute)
import FRP.Event (Event)

data OnMouseup = OnMouseup

instance Attr anything OnMouseup Cb where
  attr OnMouseup value = unsafeAttribute { key: "mouseup", value: cb' value }

instance Attr anything OnMouseup (Effect Unit) where
  attr OnMouseup value = unsafeAttribute
    { key: "mouseup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseup (Effect Boolean) where
  attr OnMouseup value = unsafeAttribute
    { key: "mouseup", value: cb' (Cb (const value)) }

type OnMouseupEffect = forall element. Attr element OnMouseup (Effect Unit) => Event (Attribute element)
