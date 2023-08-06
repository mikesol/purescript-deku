module Deku.DOM.Attr.OnKeypress where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnKeypress = OnKeypress

instance Attr anything OnKeypress  Cb  where
  attr OnKeypress value = unsafeAttribute $ Left $  
    { key: "keypress", value: cb' value }
instance Attr anything OnKeypress (Event.Event  Cb ) where
  attr OnKeypress eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keypress", value: cb' value }


instance Attr anything OnKeypress  (Effect Unit)  where
  attr OnKeypress value = unsafeAttribute $ Left $  
    { key: "keypress", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnKeypress (Event.Event  (Effect Unit) ) where
  attr OnKeypress eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keypress", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnKeypress  (Effect Boolean)  where
  attr OnKeypress value = unsafeAttribute $ Left $  
    { key: "keypress", value: cb' (Cb (const value)) }
instance Attr anything OnKeypress (Event.Event  (Effect Boolean) ) where
  attr OnKeypress eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keypress", value: cb' (Cb (const value)) }


instance Attr everything OnKeypress  Unit  where
  attr OnKeypress _ = unsafeAttribute $ Left $  
    { key: "keypress", value: unset' }
instance Attr everything OnKeypress (Event.Event  Unit ) where
  attr OnKeypress eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "keypress", value: unset' }
