module Deku.DOM.Attr.OnSecuritypolicyviolation where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSecuritypolicyviolation = OnSecuritypolicyviolation

instance Attr anything OnSecuritypolicyviolation  Cb  where
  attr OnSecuritypolicyviolation value = unsafeAttribute (  
    { key: "securitypolicyviolation", value: cb' value  } <$ _)
instance Attr anything OnSecuritypolicyviolation (Event.Event  Cb ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "securitypolicyviolation", value: cb' value }


instance Attr anything OnSecuritypolicyviolation  (Effect Unit)  where
  attr OnSecuritypolicyviolation value = unsafeAttribute (  
    { key: "securitypolicyviolation", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnSecuritypolicyviolation (Event.Event  (Effect Unit) ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "securitypolicyviolation"
      , value: cb' (Cb (const (value $> true)))
      }


instance Attr anything OnSecuritypolicyviolation  (Effect Boolean)  where
  attr OnSecuritypolicyviolation value = unsafeAttribute (  
    { key: "securitypolicyviolation", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnSecuritypolicyviolation (Event.Event  (Effect Boolean) ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "securitypolicyviolation", value: cb' (Cb (const value)) } 


instance Attr everything OnSecuritypolicyviolation  Unit  where
  attr OnSecuritypolicyviolation _ = unsafeAttribute (  
    { key: "securitypolicyviolation", value: unset'  } <$ _)
instance Attr everything OnSecuritypolicyviolation (Event.Event  Unit ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute \_ ->
    eventValue <#> \_ -> { key: "securitypolicyviolation", value: unset' }
