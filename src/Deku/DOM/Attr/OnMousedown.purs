module Deku.DOM.Attr.OnMousedown where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

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

type OnMousedownEffect =
  forall element
   . Attr element OnMousedown (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMousedown Unit where
  attr OnMousedown _ = unsafeAttribute
    { key: "mousedown", value: unset' }
