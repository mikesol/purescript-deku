module Deku.DOM.Attr.OnDragend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragend = OnDragend

instance Attr anything OnDragend Cb where
  attr OnDragend value = unsafeAttribute { key: "dragend", value: cb' value }

instance Attr anything OnDragend (Effect Unit) where
  attr OnDragend value = unsafeAttribute
    { key: "dragend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragend (Effect Boolean) where
  attr OnDragend value = unsafeAttribute
    { key: "dragend", value: cb' (Cb (const value)) }

type OnDragendEffect =
  forall element
   . Attr element OnDragend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragend Unit where
  attr OnDragend _ = unsafeAttribute
    { key: "dragend", value: unset' }
