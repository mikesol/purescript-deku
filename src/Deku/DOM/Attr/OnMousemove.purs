module Deku.DOM.Attr.OnMousemove where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnMousemove = OnMousemove

instance Attr anything OnMousemove  Cb  where
  attr OnMousemove value = unsafeAttribute $ Left $  
    { key: "mousemove", value: cb' value }
instance Attr anything OnMousemove (Event.Event  Cb ) where
  attr OnMousemove eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mousemove", value: cb' value }


instance Attr anything OnMousemove  (Effect Unit)  where
  attr OnMousemove value = unsafeAttribute $ Left $  
    { key: "mousemove", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMousemove (Event.Event  (Effect Unit) ) where
  attr OnMousemove eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mousemove", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnMousemove  (Effect Boolean)  where
  attr OnMousemove value = unsafeAttribute $ Left $  
    { key: "mousemove", value: cb' (Cb (const value)) }
instance Attr anything OnMousemove (Event.Event  (Effect Boolean) ) where
  attr OnMousemove eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mousemove", value: cb' (Cb (const value)) }


instance Attr everything OnMousemove  Unit  where
  attr OnMousemove _ = unsafeAttribute $ Left $  
    { key: "mousemove", value: unset' }
instance Attr everything OnMousemove (Event.Event  Unit ) where
  attr OnMousemove eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "mousemove", value: unset' }
