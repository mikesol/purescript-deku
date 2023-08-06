module Deku.DOM.Attr.OnDragstart where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDragstart = OnDragstart

instance Attr anything OnDragstart  Cb  where
  attr OnDragstart value = unsafeAttribute $ Left $  
    { key: "dragstart", value: cb' value }
instance Attr anything OnDragstart (Event.Event  Cb ) where
  attr OnDragstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragstart", value: cb' value }


instance Attr anything OnDragstart  (Effect Unit)  where
  attr OnDragstart value = unsafeAttribute $ Left $  
    { key: "dragstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragstart (Event.Event  (Effect Unit) ) where
  attr OnDragstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragstart", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDragstart  (Effect Boolean)  where
  attr OnDragstart value = unsafeAttribute $ Left $  
    { key: "dragstart", value: cb' (Cb (const value)) }
instance Attr anything OnDragstart (Event.Event  (Effect Boolean) ) where
  attr OnDragstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragstart", value: cb' (Cb (const value)) }


instance Attr everything OnDragstart  Unit  where
  attr OnDragstart _ = unsafeAttribute $ Left $  
    { key: "dragstart", value: unset' }
instance Attr everything OnDragstart (Event.Event  Unit ) where
  attr OnDragstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "dragstart", value: unset' }
