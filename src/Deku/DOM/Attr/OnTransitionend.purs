module Deku.DOM.Attr.OnTransitionend where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnTransitionend = OnTransitionend

instance Attr anything OnTransitionend  Cb  where
  attr OnTransitionend value = unsafeAttribute (  
    { key: "transitionend", value: cb' value  } <$ _)
instance Attr anything OnTransitionend (Event.Event  Cb ) where
  attr OnTransitionend eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "transitionend", value: cb' value }


instance Attr anything OnTransitionend  (Effect Unit)  where
  attr OnTransitionend value = unsafeAttribute (  
    { key: "transitionend", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnTransitionend (Event.Event  (Effect Unit) ) where
  attr OnTransitionend eventValue = unsafeAttribute \_ -> eventValue
    <#> \value ->
      { key: "transitionend", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTransitionend  (Effect Boolean)  where
  attr OnTransitionend value = unsafeAttribute (  
    { key: "transitionend", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnTransitionend (Event.Event  (Effect Boolean) ) where
  attr OnTransitionend eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "transitionend", value: cb' (Cb (const value)) } 


instance Attr everything OnTransitionend  Unit  where
  attr OnTransitionend _ = unsafeAttribute (  
    { key: "transitionend", value: unset'  } <$ _)
instance Attr everything OnTransitionend (Event.Event  Unit ) where
  attr OnTransitionend eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "transitionend", value: unset' }
