module Deku.DOM.Attr.OnLostpointercapture where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnLostpointercapture = OnLostpointercapture

instance Attr anything OnLostpointercapture  Cb  where
  attr OnLostpointercapture value = unsafeAttribute $ Left $  
    { key: "lostpointercapture", value: cb' value }
instance Attr anything OnLostpointercapture (Event.Event  Cb ) where
  attr OnLostpointercapture eventValue = unsafeAttribute $ Right $
    eventValue <#> \value -> { key: "lostpointercapture", value: cb' value }


instance Attr anything OnLostpointercapture  (Effect Unit)  where
  attr OnLostpointercapture value = unsafeAttribute $ Left $  
    { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLostpointercapture (Event.Event  (Effect Unit) ) where
  attr OnLostpointercapture eventValue = unsafeAttribute $ Right $
    eventValue <#> \value ->
      { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnLostpointercapture  (Effect Boolean)  where
  attr OnLostpointercapture value = unsafeAttribute $ Left $  
    { key: "lostpointercapture", value: cb' (Cb (const value)) }
instance Attr anything OnLostpointercapture (Event.Event  (Effect Boolean) ) where
  attr OnLostpointercapture eventValue = unsafeAttribute $ Right $
    eventValue <#> \value ->
      { key: "lostpointercapture", value: cb' (Cb (const value)) }


instance Attr everything OnLostpointercapture  Unit  where
  attr OnLostpointercapture _ = unsafeAttribute $ Left $  
    { key: "lostpointercapture", value: unset' }
instance Attr everything OnLostpointercapture (Event.Event  Unit ) where
  attr OnLostpointercapture eventValue = unsafeAttribute $ Right $
    eventValue <#> \_ -> { key: "lostpointercapture", value: unset' }
