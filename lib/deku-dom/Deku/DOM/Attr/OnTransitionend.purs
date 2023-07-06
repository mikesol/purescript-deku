module Deku.DOM.Attr.OnTransitionend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTransitionend = OnTransitionend

instance Attr anything OnTransitionend Cb where
  attr OnTransitionend value = unsafeAttribute
    { key: "transitionend", value: cb' value }

instance Attr anything OnTransitionend (Effect Unit) where
  attr OnTransitionend value = unsafeAttribute
    { key: "transitionend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionend (Effect Boolean) where
  attr OnTransitionend value = unsafeAttribute
    { key: "transitionend", value: cb' (Cb (const value)) }

type OnTransitionendEffect =
  forall element
   . Attr element OnTransitionend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitionend Unit where
  attr OnTransitionend _ = unsafeAttribute
    { key: "transitionend", value: unset' }
