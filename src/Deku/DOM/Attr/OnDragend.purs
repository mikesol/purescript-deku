module Deku.DOM.Attr.OnDragend where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDragend = OnDragend

instance Attr anything OnDragend  Cb  where
  attr OnDragend value = unsafeAttribute $ Left $  
    { key: "dragend", value: cb' value }
instance Attr anything OnDragend (Event.Event  Cb ) where
  attr OnDragend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragend", value: cb' value }


instance Attr anything OnDragend  (Effect Unit)  where
  attr OnDragend value = unsafeAttribute $ Left $  
    { key: "dragend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragend (Event.Event  (Effect Unit) ) where
  attr OnDragend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragend", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDragend  (Effect Boolean)  where
  attr OnDragend value = unsafeAttribute $ Left $  
    { key: "dragend", value: cb' (Cb (const value)) }
instance Attr anything OnDragend (Event.Event  (Effect Boolean) ) where
  attr OnDragend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragend", value: cb' (Cb (const value)) }


instance Attr everything OnDragend  Unit  where
  attr OnDragend _ = unsafeAttribute $ Left $  
    { key: "dragend", value: unset' }
instance Attr everything OnDragend (Event.Event  Unit ) where
  attr OnDragend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "dragend", value: unset' }
