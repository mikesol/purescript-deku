module Deku.DOM.Attr.OnContextmenu where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnContextmenu = OnContextmenu

instance Attr anything OnContextmenu  Cb  where
  attr OnContextmenu value = unsafeAttribute $ Left $  
    { key: "contextmenu", value: cb' value }
instance Attr anything OnContextmenu (Event.Event  Cb ) where
  attr OnContextmenu eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "contextmenu", value: cb' value }


instance Attr anything OnContextmenu  (Effect Unit)  where
  attr OnContextmenu value = unsafeAttribute $ Left $  
    { key: "contextmenu", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnContextmenu (Event.Event  (Effect Unit) ) where
  attr OnContextmenu eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "contextmenu", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnContextmenu  (Effect Boolean)  where
  attr OnContextmenu value = unsafeAttribute $ Left $  
    { key: "contextmenu", value: cb' (Cb (const value)) }
instance Attr anything OnContextmenu (Event.Event  (Effect Boolean) ) where
  attr OnContextmenu eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "contextmenu", value: cb' (Cb (const value)) }


instance Attr everything OnContextmenu  Unit  where
  attr OnContextmenu _ = unsafeAttribute $ Left $  
    { key: "contextmenu", value: unset' }
instance Attr everything OnContextmenu (Event.Event  Unit ) where
  attr OnContextmenu eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "contextmenu", value: unset' }
