module Deku.DOM.Attr.OnMousemove where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMousemove = OnMousemove

instance Attr anything OnMousemove Cb where
  attr OnMousemove value = unsafeAttribute
    { key: "mousemove", value: cb' value }

instance Attr anything OnMousemove (Effect Unit) where
  attr OnMousemove value = unsafeAttribute
    { key: "mousemove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousemove (Effect Boolean) where
  attr OnMousemove value = unsafeAttribute
    { key: "mousemove", value: cb' (Cb (const value)) }

type OnMousemoveEffect =
  forall element
   . Attr element OnMousemove (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMousemove Unit where
  attr OnMousemove _ = unsafeAttribute
    { key: "mousemove", value: unset' }
