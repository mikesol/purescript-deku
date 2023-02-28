module Deku.DOM.Attr.OnTransitionrun where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTransitionrun = OnTransitionrun

instance Attr anything OnTransitionrun Cb where
  attr OnTransitionrun value = unsafeAttribute
    { key: "transitionrun", value: cb' value }

instance Attr anything OnTransitionrun (Effect Unit) where
  attr OnTransitionrun value = unsafeAttribute
    { key: "transitionrun", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionrun (Effect Boolean) where
  attr OnTransitionrun value = unsafeAttribute
    { key: "transitionrun", value: cb' (Cb (const value)) }

type OnTransitionrunEffect =
  forall element
   . Attr element OnTransitionrun (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitionrun Unit where
  attr OnTransitionrun _ = unsafeAttribute
    { key: "transitionrun", value: unset' }
