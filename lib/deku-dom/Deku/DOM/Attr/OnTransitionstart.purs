module Deku.DOM.Attr.OnTransitionstart where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTransitionstart = OnTransitionstart

instance Attr anything OnTransitionstart Cb where
  attr OnTransitionstart value = unsafeAttribute
    { key: "transitionstart", value: cb' value }

instance Attr anything OnTransitionstart (Effect Unit) where
  attr OnTransitionstart value = unsafeAttribute
    { key: "transitionstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionstart (Effect Boolean) where
  attr OnTransitionstart value = unsafeAttribute
    { key: "transitionstart", value: cb' (Cb (const value)) }

type OnTransitionstartEffect =
  forall element
   . Attr element OnTransitionstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitionstart Unit where
  attr OnTransitionstart _ = unsafeAttribute
    { key: "transitionstart", value: unset' }
