module Deku.DOM.Attr.OnSecuritypolicyviolation where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

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