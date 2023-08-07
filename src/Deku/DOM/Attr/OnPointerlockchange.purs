module Deku.DOM.Attr.OnPointerlockchange where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPointerlockchange = OnPointerlockchange

instance Attr anything OnPointerlockchange  Cb  where
  attr OnPointerlockchange value = unsafeAttribute (  
    { key: "pointerlockchange", value: cb' value  } <$ _)
instance Attr anything OnPointerlockchange (Event.Event  Cb ) where
  attr OnPointerlockchange eventValue = unsafeAttribute \_ ->
    eventValue <#> \value -> { key: "pointerlockchange", value: cb' value }


instance Attr anything OnPointerlockchange  (Effect Unit)  where
  attr OnPointerlockchange value = unsafeAttribute (  
    { key: "pointerlockchange", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnPointerlockchange (Event.Event  (Effect Unit) ) where
  attr OnPointerlockchange eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointerlockchange  (Effect Boolean)  where
  attr OnPointerlockchange value = unsafeAttribute (  
    { key: "pointerlockchange", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnPointerlockchange (Event.Event  (Effect Boolean) ) where
  attr OnPointerlockchange eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "pointerlockchange", value: cb' (Cb (const value)) } 


instance Attr everything OnPointerlockchange  Unit  where
  attr OnPointerlockchange _ = unsafeAttribute (  
    { key: "pointerlockchange", value: unset'  } <$ _)
instance Attr everything OnPointerlockchange (Event.Event  Unit ) where
  attr OnPointerlockchange eventValue = unsafeAttribute \_ ->
    eventValue <#> \_ -> { key: "pointerlockchange", value: unset' }
