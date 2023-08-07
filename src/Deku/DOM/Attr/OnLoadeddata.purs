module Deku.DOM.Attr.OnLoadeddata where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnLoadeddata = OnLoadeddata

instance Attr anything OnLoadeddata  Cb  where
  attr OnLoadeddata value = unsafeAttribute (  
    { key: "loadeddata", value: cb' value  } <$ _)
instance Attr anything OnLoadeddata (Event.Event  Cb ) where
  attr OnLoadeddata eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "loadeddata", value: cb' value }


instance Attr anything OnLoadeddata  (Effect Unit)  where
  attr OnLoadeddata value = unsafeAttribute (  
    { key: "loadeddata", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnLoadeddata (Event.Event  (Effect Unit) ) where
  attr OnLoadeddata eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "loadeddata", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnLoadeddata  (Effect Boolean)  where
  attr OnLoadeddata value = unsafeAttribute (  
    { key: "loadeddata", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnLoadeddata (Event.Event  (Effect Boolean) ) where
  attr OnLoadeddata eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "loadeddata", value: cb' (Cb (const value)) } 


instance Attr everything OnLoadeddata  Unit  where
  attr OnLoadeddata _ = unsafeAttribute (  
    { key: "loadeddata", value: unset'  } <$ _)
instance Attr everything OnLoadeddata (Event.Event  Unit ) where
  attr OnLoadeddata eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "loadeddata", value: unset' }
