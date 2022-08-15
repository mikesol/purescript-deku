module Deku.DOM.Attr.OnSecuritypolicyviolation where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

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

instance Attr anything OnSecuritypolicyviolation (Zora Unit) where
  attr OnSecuritypolicyviolation value = unsafeAttribute
    { key: "securitypolicyviolation"
    , value: cb' (Cb (const (runImpure (value $> true))))
    }

instance Attr anything OnSecuritypolicyviolation (Zora Boolean) where
  attr OnSecuritypolicyviolation value = unsafeAttribute
    { key: "securitypolicyviolation"
    , value: cb' (Cb (const (runImpure value)))
    }