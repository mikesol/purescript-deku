module Deku.DOM.Attr.OnInput where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnInput = OnInput

instance Attr anything OnInput Cb where
  attr OnInput value = unsafeAttribute { key: "input", value: cb' value }

instance Attr anything OnInput (Effect Unit) where
  attr OnInput value = unsafeAttribute
    { key: "input", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnInput (Effect Boolean) where
  attr OnInput value = unsafeAttribute
    { key: "input", value: cb' (Cb (const value)) }

type OnInputEffect =
  forall element
   . Attr element OnInput (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnInput Unit where
  attr OnInput _ = unsafeAttribute
    { key: "input", value: unset' }
