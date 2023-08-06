module Deku.DOM.Attr.OnDrop where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDrop = OnDrop

instance Attr anything OnDrop  Cb  where
  attr OnDrop value = unsafeAttribute $ Left $  
    { key: "drop", value: cb' value }
instance Attr anything OnDrop (Event.Event  Cb ) where
  attr OnDrop eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "drop", value: cb' value }


instance Attr anything OnDrop  (Effect Unit)  where
  attr OnDrop value = unsafeAttribute $ Left $  
    { key: "drop", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDrop (Event.Event  (Effect Unit) ) where
  attr OnDrop eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "drop", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDrop  (Effect Boolean)  where
  attr OnDrop value = unsafeAttribute $ Left $  
    { key: "drop", value: cb' (Cb (const value)) }
instance Attr anything OnDrop (Event.Event  (Effect Boolean) ) where
  attr OnDrop eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "drop", value: cb' (Cb (const value)) }


instance Attr everything OnDrop  Unit  where
  attr OnDrop _ = unsafeAttribute $ Left $  { key: "drop", value: unset' }
instance Attr everything OnDrop (Event.Event  Unit ) where
  attr OnDrop eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "drop", value: unset' }
