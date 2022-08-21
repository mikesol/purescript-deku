module Deku.DOM.Attr.OnTransitionend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

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

instance Attr anything OnTransitionend (Zora Unit) where
  attr OnTransitionend value = unsafeAttribute
    { key: "transitionend"
    , value: cb' (Cb (const (runImpure (value $> true))))
    }

instance Attr anything OnTransitionend (Zora Boolean) where
  attr OnTransitionend value = unsafeAttribute
    { key: "transitionend", value: cb' (Cb (const (runImpure value))) }