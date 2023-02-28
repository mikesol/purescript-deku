module Deku.DOM.Attr.OnDragstart where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragstart = OnDragstart

instance Attr anything OnDragstart Cb where
  attr OnDragstart value = unsafeAttribute
    { key: "dragstart", value: cb' value }

instance Attr anything OnDragstart (Effect Unit) where
  attr OnDragstart value = unsafeAttribute
    { key: "dragstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragstart (Effect Boolean) where
  attr OnDragstart value = unsafeAttribute
    { key: "dragstart", value: cb' (Cb (const value)) }

type OnDragstartEffect =
  forall element
   . Attr element OnDragstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragstart Unit where
  attr OnDragstart _ = unsafeAttribute
    { key: "dragstart", value: unset' }
