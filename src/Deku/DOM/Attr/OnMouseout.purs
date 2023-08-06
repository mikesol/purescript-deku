module Deku.DOM.Attr.OnMouseout where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnMouseout = OnMouseout

instance Attr anything OnMouseout  Cb  where
  attr OnMouseout value = unsafeAttribute $ Left $  
    { key: "mouseout", value: cb' value }
instance Attr anything OnMouseout (Event.Event  Cb ) where
  attr OnMouseout eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseout", value: cb' value }


instance Attr anything OnMouseout  (Effect Unit)  where
  attr OnMouseout value = unsafeAttribute $ Left $  
    { key: "mouseout", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseout (Event.Event  (Effect Unit) ) where
  attr OnMouseout eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseout", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnMouseout  (Effect Boolean)  where
  attr OnMouseout value = unsafeAttribute $ Left $  
    { key: "mouseout", value: cb' (Cb (const value)) }
instance Attr anything OnMouseout (Event.Event  (Effect Boolean) ) where
  attr OnMouseout eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseout", value: cb' (Cb (const value)) }


instance Attr everything OnMouseout  Unit  where
  attr OnMouseout _ = unsafeAttribute $ Left $  
    { key: "mouseout", value: unset' }
instance Attr everything OnMouseout (Event.Event  Unit ) where
  attr OnMouseout eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "mouseout", value: unset' }
