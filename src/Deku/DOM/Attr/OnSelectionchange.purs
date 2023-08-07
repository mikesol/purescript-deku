module Deku.DOM.Attr.OnSelectionchange where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSelectionchange = OnSelectionchange

instance Attr anything OnSelectionchange  Cb  where
  attr OnSelectionchange value = unsafeAttribute (  
    { key: "selectionchange", value: cb' value  } <$ _)
instance Attr anything OnSelectionchange (Event.Event  Cb ) where
  attr OnSelectionchange eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "selectionchange", value: cb' value }


instance Attr anything OnSelectionchange  (Effect Unit)  where
  attr OnSelectionchange value = unsafeAttribute (  
    { key: "selectionchange", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnSelectionchange (Event.Event  (Effect Unit) ) where
  attr OnSelectionchange eventValue = unsafeAttribute \_ -> eventValue
    <#> \value ->
      { key: "selectionchange", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnSelectionchange  (Effect Boolean)  where
  attr OnSelectionchange value = unsafeAttribute (  
    { key: "selectionchange", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnSelectionchange (Event.Event  (Effect Boolean) ) where
  attr OnSelectionchange eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "selectionchange", value: cb' (Cb (const value)) } 


instance Attr everything OnSelectionchange  Unit  where
  attr OnSelectionchange _ = unsafeAttribute (  
    { key: "selectionchange", value: unset'  } <$ _)
instance Attr everything OnSelectionchange (Event.Event  Unit ) where
  attr OnSelectionchange eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "selectionchange", value: unset' }
