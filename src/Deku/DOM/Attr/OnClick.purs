module Deku.DOM.Attr.OnClick where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnClick = OnClick

instance Attr anything OnClick  Cb  where
  attr OnClick value = unsafeAttribute $ Left $  
    { key: "click", value: cb' value }
instance Attr anything OnClick (Event.Event  Cb ) where
  attr OnClick eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "click", value: cb' value }


instance Attr anything OnClick  (Effect Unit)  where
  attr OnClick value = unsafeAttribute $ Left $  
    { key: "click", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnClick (Event.Event  (Effect Unit) ) where
  attr OnClick eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "click", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnClick  (Effect Boolean)  where
  attr OnClick value = unsafeAttribute $ Left $  
    { key: "click", value: cb' (Cb (const value)) }
instance Attr anything OnClick (Event.Event  (Effect Boolean) ) where
  attr OnClick eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "click", value: cb' (Cb (const value)) }


instance Attr everything OnClick  Unit  where
  attr OnClick _ = unsafeAttribute $ Left $  { key: "click", value: unset' }
instance Attr everything OnClick (Event.Event  Unit ) where
  attr OnClick eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "click", value: unset' }
