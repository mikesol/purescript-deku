module Deku.DOM.Attr.OnMouseenter where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

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

type OnMouseenterEffect =
  forall element
   . Attr element OnMouseenter (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseenter Unit where
  attr OnMouseenter _ = unsafeAttribute
    { key: "mouseenter", value: unset' }
