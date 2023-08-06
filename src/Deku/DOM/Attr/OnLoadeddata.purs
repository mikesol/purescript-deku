module Deku.DOM.Attr.OnLoadeddata where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnLoadeddata = OnLoadeddata

instance Attr anything OnLoadeddata  Cb  where
  attr OnLoadeddata value = unsafeAttribute $ Left $  
    { key: "loadeddata", value: cb' value }
instance Attr anything OnLoadeddata (Event.Event  Cb ) where
  attr OnLoadeddata eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "loadeddata", value: cb' value }


instance Attr anything OnLoadeddata  (Effect Unit)  where
  attr OnLoadeddata value = unsafeAttribute $ Left $  
    { key: "loadeddata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadeddata (Event.Event  (Effect Unit) ) where
  attr OnLoadeddata eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "loadeddata", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnLoadeddata  (Effect Boolean)  where
  attr OnLoadeddata value = unsafeAttribute $ Left $  
    { key: "loadeddata", value: cb' (Cb (const value)) }
instance Attr anything OnLoadeddata (Event.Event  (Effect Boolean) ) where
  attr OnLoadeddata eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "loadeddata", value: cb' (Cb (const value)) }


instance Attr everything OnLoadeddata  Unit  where
  attr OnLoadeddata _ = unsafeAttribute $ Left $  
    { key: "loadeddata", value: unset' }
instance Attr everything OnLoadeddata (Event.Event  Unit ) where
  attr OnLoadeddata eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "loadeddata", value: unset' }
