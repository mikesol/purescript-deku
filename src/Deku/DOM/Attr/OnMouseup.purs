module Deku.DOM.Attr.OnMouseup where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnMouseup = OnMouseup

instance Attr anything OnMouseup  Cb  where
  attr OnMouseup value = unsafeAttribute $ Left $  
    { key: "mouseup", value: cb' value }
instance Attr anything OnMouseup (Event.Event  Cb ) where
  attr OnMouseup eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseup", value: cb' value }


instance Attr anything OnMouseup  (Effect Unit)  where
  attr OnMouseup value = unsafeAttribute $ Left $  
    { key: "mouseup", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseup (Event.Event  (Effect Unit) ) where
  attr OnMouseup eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseup", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnMouseup  (Effect Boolean)  where
  attr OnMouseup value = unsafeAttribute $ Left $  
    { key: "mouseup", value: cb' (Cb (const value)) }
instance Attr anything OnMouseup (Event.Event  (Effect Boolean) ) where
  attr OnMouseup eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseup", value: cb' (Cb (const value)) }


instance Attr everything OnMouseup  Unit  where
  attr OnMouseup _ = unsafeAttribute $ Left $  
    { key: "mouseup", value: unset' }
instance Attr everything OnMouseup (Event.Event  Unit ) where
  attr OnMouseup eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "mouseup", value: unset' }
