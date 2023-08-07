module Deku.DOM.Attr.OnLoadedmetadata where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnLoadedmetadata = OnLoadedmetadata

instance Attr anything OnLoadedmetadata  Cb  where
  attr OnLoadedmetadata value = unsafeAttribute (  
    { key: "loadedmetadata", value: cb' value  } <$ _)
instance Attr anything OnLoadedmetadata (Event.Event  Cb ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "loadedmetadata", value: cb' value }


instance Attr anything OnLoadedmetadata  (Effect Unit)  where
  attr OnLoadedmetadata value = unsafeAttribute (  
    { key: "loadedmetadata", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnLoadedmetadata (Event.Event  (Effect Unit) ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute \_ -> eventValue
    <#> \value ->
      { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnLoadedmetadata  (Effect Boolean)  where
  attr OnLoadedmetadata value = unsafeAttribute (  
    { key: "loadedmetadata", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnLoadedmetadata (Event.Event  (Effect Boolean) ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "loadedmetadata", value: cb' (Cb (const value)) } 


instance Attr everything OnLoadedmetadata  Unit  where
  attr OnLoadedmetadata _ = unsafeAttribute (  
    { key: "loadedmetadata", value: unset'  } <$ _)
instance Attr everything OnLoadedmetadata (Event.Event  Unit ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "loadedmetadata", value: unset' }
