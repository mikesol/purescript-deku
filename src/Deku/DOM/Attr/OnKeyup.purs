module Deku.DOM.Attr.OnKeyup where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnKeyup = OnKeyup

instance Attr anything OnKeyup  Cb  where
  attr OnKeyup value = unsafeAttribute $ Left $  
    { key: "keyup", value: cb' value }
instance Attr anything OnKeyup (Event.Event  Cb ) where
  attr OnKeyup eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keyup", value: cb' value }


instance Attr anything OnKeyup  (Effect Unit)  where
  attr OnKeyup value = unsafeAttribute $ Left $  
    { key: "keyup", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnKeyup (Event.Event  (Effect Unit) ) where
  attr OnKeyup eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keyup", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnKeyup  (Effect Boolean)  where
  attr OnKeyup value = unsafeAttribute $ Left $  
    { key: "keyup", value: cb' (Cb (const value)) }
instance Attr anything OnKeyup (Event.Event  (Effect Boolean) ) where
  attr OnKeyup eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keyup", value: cb' (Cb (const value)) }


instance Attr everything OnKeyup  Unit  where
  attr OnKeyup _ = unsafeAttribute $ Left $  { key: "keyup", value: unset' }
instance Attr everything OnKeyup (Event.Event  Unit ) where
  attr OnKeyup eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "keyup", value: unset' }
