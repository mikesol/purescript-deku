module Deku.DOM.Attr.OnKeypress where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnKeypress = OnKeypress

instance Attr anything OnKeypress Cb where
  attr OnKeypress value = unsafeAttribute { key: "keypress", value: cb' value }

instance Attr anything OnKeypress (Effect Unit) where
  attr OnKeypress value = unsafeAttribute
    { key: "keypress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeypress (Effect Boolean) where
  attr OnKeypress value = unsafeAttribute
    { key: "keypress", value: cb' (Cb (const value)) }

type OnKeypressEffect =
  forall element
   . Attr element OnKeypress (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnKeypress Unit where
  attr OnKeypress _ = unsafeAttribute
    { key: "keypress", value: unset' }
