module Deku.DOM.Attr.OnSlotchange where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSlotchange = OnSlotchange

instance Attr anything OnSlotchange Cb where
  attr OnSlotchange value = unsafeAttribute
    { key: "slotchange", value: cb' value }

instance Attr anything OnSlotchange (Effect Unit) where
  attr OnSlotchange value = unsafeAttribute
    { key: "slotchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSlotchange (Effect Boolean) where
  attr OnSlotchange value = unsafeAttribute
    { key: "slotchange", value: cb' (Cb (const value)) }

type OnSlotchangeEffect =
  forall element
   . Attr element OnSlotchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSlotchange Unit where
  attr OnSlotchange _ = unsafeAttribute
    { key: "slotchange", value: unset' }
