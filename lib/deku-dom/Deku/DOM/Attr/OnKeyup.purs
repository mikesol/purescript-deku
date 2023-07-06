module Deku.DOM.Attr.OnKeyup where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnKeyup = OnKeyup

instance Attr anything OnKeyup Cb where
  attr OnKeyup value = unsafeAttribute { key: "keyup", value: cb' value }

instance Attr anything OnKeyup (Effect Unit) where
  attr OnKeyup value = unsafeAttribute
    { key: "keyup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeyup (Effect Boolean) where
  attr OnKeyup value = unsafeAttribute
    { key: "keyup", value: cb' (Cb (const value)) }

type OnKeyupEffect =
  forall element
   . Attr element OnKeyup (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnKeyup Unit where
  attr OnKeyup _ = unsafeAttribute
    { key: "keyup", value: unset' }
