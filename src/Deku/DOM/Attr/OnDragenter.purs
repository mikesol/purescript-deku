module Deku.DOM.Attr.OnDragenter where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragenter = OnDragenter

instance Attr anything OnDragenter Cb where
  attr OnDragenter value = unsafeAttribute
    { key: "dragenter", value: cb' value }

instance Attr anything OnDragenter (Effect Unit) where
  attr OnDragenter value = unsafeAttribute
    { key: "dragenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragenter (Effect Boolean) where
  attr OnDragenter value = unsafeAttribute
    { key: "dragenter", value: cb' (Cb (const value)) }

type OnDragenterEffect =
  forall element
   . Attr element OnDragenter (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragenter Unit where
  attr OnDragenter _ = unsafeAttribute
    { key: "dragenter", value: unset' }
