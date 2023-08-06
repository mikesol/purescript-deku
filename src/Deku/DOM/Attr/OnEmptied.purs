module Deku.DOM.Attr.OnEmptied where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnEmptied = OnEmptied

instance Attr anything OnEmptied  Cb  where
  attr OnEmptied value = unsafeAttribute $ Left $  
    { key: "emptied", value: cb' value }
instance Attr anything OnEmptied (Event.Event  Cb ) where
  attr OnEmptied eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "emptied", value: cb' value }


instance Attr anything OnEmptied  (Effect Unit)  where
  attr OnEmptied value = unsafeAttribute $ Left $  
    { key: "emptied", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnEmptied (Event.Event  (Effect Unit) ) where
  attr OnEmptied eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "emptied", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnEmptied  (Effect Boolean)  where
  attr OnEmptied value = unsafeAttribute $ Left $  
    { key: "emptied", value: cb' (Cb (const value)) }
instance Attr anything OnEmptied (Event.Event  (Effect Boolean) ) where
  attr OnEmptied eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "emptied", value: cb' (Cb (const value)) }


instance Attr everything OnEmptied  Unit  where
  attr OnEmptied _ = unsafeAttribute $ Left $  
    { key: "emptied", value: unset' }
instance Attr everything OnEmptied (Event.Event  Unit ) where
  attr OnEmptied eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "emptied", value: unset' }
