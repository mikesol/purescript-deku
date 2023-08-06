module Deku.DOM.Attr.OnDragenter where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDragenter = OnDragenter

instance Attr anything OnDragenter  Cb  where
  attr OnDragenter value = unsafeAttribute $ Left $  
    { key: "dragenter", value: cb' value }
instance Attr anything OnDragenter (Event.Event  Cb ) where
  attr OnDragenter eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragenter", value: cb' value }


instance Attr anything OnDragenter  (Effect Unit)  where
  attr OnDragenter value = unsafeAttribute $ Left $  
    { key: "dragenter", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragenter (Event.Event  (Effect Unit) ) where
  attr OnDragenter eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragenter", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDragenter  (Effect Boolean)  where
  attr OnDragenter value = unsafeAttribute $ Left $  
    { key: "dragenter", value: cb' (Cb (const value)) }
instance Attr anything OnDragenter (Event.Event  (Effect Boolean) ) where
  attr OnDragenter eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragenter", value: cb' (Cb (const value)) }


instance Attr everything OnDragenter  Unit  where
  attr OnDragenter _ = unsafeAttribute $ Left $  
    { key: "dragenter", value: unset' }
instance Attr everything OnDragenter (Event.Event  Unit ) where
  attr OnDragenter eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "dragenter", value: unset' }
