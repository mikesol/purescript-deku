module Deku.DOM.Attr.OnChange where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnChange = OnChange

instance Attr anything OnChange  Cb  where
  attr OnChange value = unsafeAttribute $ Left $  
    { key: "change", value: cb' value }
instance Attr anything OnChange (Event.Event  Cb ) where
  attr OnChange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "change", value: cb' value }


instance Attr anything OnChange  (Effect Unit)  where
  attr OnChange value = unsafeAttribute $ Left $  
    { key: "change", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnChange (Event.Event  (Effect Unit) ) where
  attr OnChange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "change", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnChange  (Effect Boolean)  where
  attr OnChange value = unsafeAttribute $ Left $  
    { key: "change", value: cb' (Cb (const value)) }
instance Attr anything OnChange (Event.Event  (Effect Boolean) ) where
  attr OnChange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "change", value: cb' (Cb (const value)) }


instance Attr everything OnChange  Unit  where
  attr OnChange _ = unsafeAttribute $ Left $  { key: "change", value: unset' }
instance Attr everything OnChange (Event.Event  Unit ) where
  attr OnChange eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "change", value: unset' }
