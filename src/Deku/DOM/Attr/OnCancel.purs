module Deku.DOM.Attr.OnCancel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute)
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

type OnCancelEffect = forall element. Attr element OnCancel (Effect Unit) => Event (Attribute element)
