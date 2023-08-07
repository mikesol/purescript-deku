module Deku.DOM.Attr.OnTransitionstart where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnTransitionstart = OnTransitionstart

instance Attr anything OnTransitionstart  Cb  where
  attr OnTransitionstart value = unsafeAttribute (  
    { key: "transitionstart", value: cb' value  } <$ _)
instance Attr anything OnTransitionstart (Event.Event  Cb ) where
  attr OnTransitionstart eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "transitionstart", value: cb' value }


instance Attr anything OnTransitionstart  (Effect Unit)  where
  attr OnTransitionstart value = unsafeAttribute (  
    { key: "transitionstart", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnTransitionstart (Event.Event  (Effect Unit) ) where
  attr OnTransitionstart eventValue = unsafeAttribute \_ -> eventValue
    <#> \value ->
      { key: "transitionstart", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTransitionstart  (Effect Boolean)  where
  attr OnTransitionstart value = unsafeAttribute (  
    { key: "transitionstart", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnTransitionstart (Event.Event  (Effect Boolean) ) where
  attr OnTransitionstart eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "transitionstart", value: cb' (Cb (const value)) } 


instance Attr everything OnTransitionstart  Unit  where
  attr OnTransitionstart _ = unsafeAttribute (  
    { key: "transitionstart", value: unset'  } <$ _)
instance Attr everything OnTransitionstart (Event.Event  Unit ) where
  attr OnTransitionstart eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "transitionstart", value: unset' }
