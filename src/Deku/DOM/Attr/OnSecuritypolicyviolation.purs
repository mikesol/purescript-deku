module Deku.DOM.Attr.OnSecuritypolicyviolation where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnSecuritypolicyviolation = OnSecuritypolicyviolation
instance Attr anything OnSecuritypolicyviolation Cb where
  attr OnSecuritypolicyviolation value = unsafeAttribute { key: "securitypolicyviolation", value: cb' value }