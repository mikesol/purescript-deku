module Deku.DOM.Attr.OnMouseover where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnMouseover = OnMouseover

instance Attr anything OnMouseover  Cb  where
  attr OnMouseover value = unsafeAttribute $ Left $  
    { key: "mouseover", value: cb' value }
instance Attr anything OnMouseover (Event.Event  Cb ) where
  attr OnMouseover eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseover", value: cb' value }


instance Attr anything OnMouseover  (Effect Unit)  where
  attr OnMouseover value = unsafeAttribute $ Left $  
    { key: "mouseover", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseover (Event.Event  (Effect Unit) ) where
  attr OnMouseover eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseover", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnMouseover  (Effect Boolean)  where
  attr OnMouseover value = unsafeAttribute $ Left $  
    { key: "mouseover", value: cb' (Cb (const value)) }
instance Attr anything OnMouseover (Event.Event  (Effect Boolean) ) where
  attr OnMouseover eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseover", value: cb' (Cb (const value)) }


instance Attr everything OnMouseover  Unit  where
  attr OnMouseover _ = unsafeAttribute $ Left $  
    { key: "mouseover", value: unset' }
instance Attr everything OnMouseover (Event.Event  Unit ) where
  attr OnMouseover eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "mouseover", value: unset' }
