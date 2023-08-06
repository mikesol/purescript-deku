module Deku.DOM.Attr.OnClose where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnClose = OnClose

instance Attr anything OnClose  Cb  where
  attr OnClose value = unsafeAttribute $ Left $  
    { key: "close", value: cb' value }
instance Attr anything OnClose (Event.Event  Cb ) where
  attr OnClose eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "close", value: cb' value }


instance Attr anything OnClose  (Effect Unit)  where
  attr OnClose value = unsafeAttribute $ Left $  
    { key: "close", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnClose (Event.Event  (Effect Unit) ) where
  attr OnClose eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "close", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnClose  (Effect Boolean)  where
  attr OnClose value = unsafeAttribute $ Left $  
    { key: "close", value: cb' (Cb (const value)) }
instance Attr anything OnClose (Event.Event  (Effect Boolean) ) where
  attr OnClose eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "close", value: cb' (Cb (const value)) }


instance Attr everything OnClose  Unit  where
  attr OnClose _ = unsafeAttribute $ Left $  { key: "close", value: unset' }
instance Attr everything OnClose (Event.Event  Unit ) where
  attr OnClose eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "close", value: unset' }
