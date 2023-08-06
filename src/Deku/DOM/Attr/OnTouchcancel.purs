module Deku.DOM.Attr.OnTouchcancel where

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

data OnTouchcancel = OnTouchcancel

instance Attr anything OnTouchcancel  Cb  where
  attr OnTouchcancel value = unsafeAttribute $ Left $  
    { key: "touchcancel", value: cb' value }
instance Attr anything OnTouchcancel (Event.Event  Cb ) where
  attr OnTouchcancel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "touchcancel", value: cb' value }


instance Attr anything OnTouchcancel  (Effect Unit)  where
  attr OnTouchcancel value = unsafeAttribute $ Left $  
    { key: "touchcancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchcancel (Event.Event  (Effect Unit) ) where
  attr OnTouchcancel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "touchcancel", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTouchcancel  (Effect Boolean)  where
  attr OnTouchcancel value = unsafeAttribute $ Left $  
    { key: "touchcancel", value: cb' (Cb (const value)) }
instance Attr anything OnTouchcancel (Event.Event  (Effect Boolean) ) where
  attr OnTouchcancel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "touchcancel", value: cb' (Cb (const value)) }


instance Attr everything OnTouchcancel  Unit  where
  attr OnTouchcancel _ = unsafeAttribute $ Left $  
    { key: "touchcancel", value: unset' }
instance Attr everything OnTouchcancel (Event.Event  Unit ) where
  attr OnTouchcancel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "touchcancel", value: unset' }
