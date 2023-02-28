module Deku.DOM.Attr.OnTouchcancel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTouchcancel = OnTouchcancel

instance Attr anything OnTouchcancel Cb where
  attr OnTouchcancel value = unsafeAttribute
    { key: "touchcancel  ", value: cb' value }

instance Attr anything OnTouchcancel (Effect Unit) where
  attr OnTouchcancel value = unsafeAttribute
    { key: "touchcancel  ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchcancel (Effect Boolean) where
  attr OnTouchcancel value = unsafeAttribute
    { key: "touchcancel  ", value: cb' (Cb (const value)) }

type OnTouchcancelEffect =
  forall element
   . Attr element OnTouchcancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchcancel Unit where
  attr OnTouchcancel _ = unsafeAttribute
    { key: "touchcancel  ", value: unset' }
