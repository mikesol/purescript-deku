module Deku.DOM.Attr.OnSecuritypolicyviolation where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSecuritypolicyviolation = OnSecuritypolicyviolation

instance Attr anything OnSecuritypolicyviolation Cb where
  attr OnSecuritypolicyviolation value = unsafeAttribute
    { key: "securitypolicyviolation", value: cb' value }

instance Attr anything OnSecuritypolicyviolation (Effect Unit) where
  attr OnSecuritypolicyviolation value = unsafeAttribute
    { key: "securitypolicyviolation", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSecuritypolicyviolation (Effect Boolean) where
  attr OnSecuritypolicyviolation value = unsafeAttribute
    { key: "securitypolicyviolation", value: cb' (Cb (const value)) }

type OnSecuritypolicyviolationEffect =
  forall element
   . Attr element OnSecuritypolicyviolation (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSecuritypolicyviolation Unit where
  attr OnSecuritypolicyviolation _ = unsafeAttribute
    { key: "securitypolicyviolation", value: unset' }
