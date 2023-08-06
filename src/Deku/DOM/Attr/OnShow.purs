module Deku.DOM.Attr.OnShow where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnShow = OnShow

instance Attr anything OnShow  Cb  where
  attr OnShow value = unsafeAttribute $ Left $  
    { key: "show", value: cb' value }
instance Attr anything OnShow (Event.Event  Cb ) where
  attr OnShow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "show", value: cb' value }


instance Attr anything OnShow  (Effect Unit)  where
  attr OnShow value = unsafeAttribute $ Left $  
    { key: "show", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnShow (Event.Event  (Effect Unit) ) where
  attr OnShow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "show", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnShow  (Effect Boolean)  where
  attr OnShow value = unsafeAttribute $ Left $  
    { key: "show", value: cb' (Cb (const value)) }
instance Attr anything OnShow (Event.Event  (Effect Boolean) ) where
  attr OnShow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "show", value: cb' (Cb (const value)) }


instance Attr everything OnShow  Unit  where
  attr OnShow _ = unsafeAttribute $ Left $  { key: "show", value: unset' }
instance Attr everything OnShow (Event.Event  Unit ) where
  attr OnShow eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "show", value: unset' }
