module Deku.DOM.Attr.OnTouchmove where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnTouchmove = OnTouchmove

instance Attr anything OnTouchmove  Cb  where
  attr OnTouchmove value = unsafeAttribute $ Left $  
    { key: "touchmove", value: cb' value }
instance Attr anything OnTouchmove (Event.Event  Cb ) where
  attr OnTouchmove eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "touchmove", value: cb' value }


instance Attr anything OnTouchmove  (Effect Unit)  where
  attr OnTouchmove value = unsafeAttribute $ Left $  
    { key: "touchmove", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchmove (Event.Event  (Effect Unit) ) where
  attr OnTouchmove eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "touchmove", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTouchmove  (Effect Boolean)  where
  attr OnTouchmove value = unsafeAttribute $ Left $  
    { key: "touchmove", value: cb' (Cb (const value)) }
instance Attr anything OnTouchmove (Event.Event  (Effect Boolean) ) where
  attr OnTouchmove eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "touchmove", value: cb' (Cb (const value)) }


instance Attr everything OnTouchmove  Unit  where
  attr OnTouchmove _ = unsafeAttribute $ Left $  
    { key: "touchmove", value: unset' }
instance Attr everything OnTouchmove (Event.Event  Unit ) where
  attr OnTouchmove eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "touchmove", value: unset' }
