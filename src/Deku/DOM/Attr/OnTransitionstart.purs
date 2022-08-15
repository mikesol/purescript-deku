module Deku.DOM.Attr.OnTransitionstart where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnTransitionstart = OnTransitionstart
instance Attr anything OnTransitionstart Cb where
  attr OnTransitionstart value = unsafeAttribute { key: "transitionstart", value: cb' value }
instance Attr anything OnTransitionstart (Effect Unit) where
  attr OnTransitionstart value = unsafeAttribute { key: "transitionstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionstart (Effect Boolean) where
  attr OnTransitionstart value = unsafeAttribute { key: "transitionstart", value: cb' (Cb (const value)) }
instance Attr anything OnTransitionstart (Zora Unit) where
  attr OnTransitionstart value = unsafeAttribute { key: "transitionstart", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnTransitionstart (Zora Boolean) where
  attr OnTransitionstart value = unsafeAttribute { key: "transitionstart", value: cb' (Cb (const (runImpure value))) }