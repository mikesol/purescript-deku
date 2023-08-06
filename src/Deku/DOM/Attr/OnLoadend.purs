module Deku.DOM.Attr.OnLoadend where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnLoadend = OnLoadend

instance Attr anything OnLoadend  Cb  where
  attr OnLoadend value = unsafeAttribute $ Left $  
    { key: "loadend", value: cb' value }
instance Attr anything OnLoadend (Event.Event  Cb ) where
  attr OnLoadend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "loadend", value: cb' value }


instance Attr anything OnLoadend  (Effect Unit)  where
  attr OnLoadend value = unsafeAttribute $ Left $  
    { key: "loadend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadend (Event.Event  (Effect Unit) ) where
  attr OnLoadend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "loadend", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnLoadend  (Effect Boolean)  where
  attr OnLoadend value = unsafeAttribute $ Left $  
    { key: "loadend", value: cb' (Cb (const value)) }
instance Attr anything OnLoadend (Event.Event  (Effect Boolean) ) where
  attr OnLoadend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "loadend", value: cb' (Cb (const value)) }


instance Attr everything OnLoadend  Unit  where
  attr OnLoadend _ = unsafeAttribute $ Left $  
    { key: "loadend", value: unset' }
instance Attr everything OnLoadend (Event.Event  Unit ) where
  attr OnLoadend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "loadend", value: unset' }
