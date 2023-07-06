module Deku.DOM.Attr.OnCancel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnCancel = OnCancel

instance Attr anything OnCancel Cb where
  attr OnCancel value = unsafeAttribute { key: "cancel", value: cb' value }

instance Attr anything OnCancel (Effect Unit) where
  attr OnCancel value = unsafeAttribute
    { key: "cancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCancel (Effect Boolean) where
  attr OnCancel value = unsafeAttribute
    { key: "cancel", value: cb' (Cb (const value)) }

type OnCancelEffect =
  forall element
   . Attr element OnCancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnCancel Unit where
  attr OnCancel _ = unsafeAttribute
    { key: "cancel", value: unset' }
