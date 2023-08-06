module Deku.DOM.Attr.OnGotpointercapture where

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

data OnGotpointercapture = OnGotpointercapture

instance Attr anything OnGotpointercapture  Cb  where
  attr OnGotpointercapture value = unsafeAttribute $ Left $  
    { key: "gotpointercapture", value: cb' value }
instance Attr anything OnGotpointercapture (Event.Event  Cb ) where
  attr OnGotpointercapture eventValue = unsafeAttribute $ Right $
    eventValue <#> \value -> { key: "gotpointercapture", value: cb' value }


instance Attr anything OnGotpointercapture  (Effect Unit)  where
  attr OnGotpointercapture value = unsafeAttribute $ Left $  
    { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnGotpointercapture (Event.Event  (Effect Unit) ) where
  attr OnGotpointercapture eventValue = unsafeAttribute $ Right $
    eventValue <#> \value ->
      { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnGotpointercapture  (Effect Boolean)  where
  attr OnGotpointercapture value = unsafeAttribute $ Left $  
    { key: "gotpointercapture", value: cb' (Cb (const value)) }
instance Attr anything OnGotpointercapture (Event.Event  (Effect Boolean) ) where
  attr OnGotpointercapture eventValue = unsafeAttribute $ Right $
    eventValue <#> \value ->
      { key: "gotpointercapture", value: cb' (Cb (const value)) }


instance Attr everything OnGotpointercapture  Unit  where
  attr OnGotpointercapture _ = unsafeAttribute $ Left $  
    { key: "gotpointercapture", value: unset' }
instance Attr everything OnGotpointercapture (Event.Event  Unit ) where
  attr OnGotpointercapture eventValue = unsafeAttribute $ Right $
    eventValue <#> \_ -> { key: "gotpointercapture", value: unset' }
