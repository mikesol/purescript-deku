module Deku.DOM.Attr.OnLoadstart where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnLoadstart = OnLoadstart

instance Attr anything OnLoadstart  Cb  where
  attr OnLoadstart value = unsafeAttribute $ Left $  
    { key: "loadstart", value: cb' value }
instance Attr anything OnLoadstart (Event.Event  Cb ) where
  attr OnLoadstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "loadstart", value: cb' value }


instance Attr anything OnLoadstart  (Effect Unit)  where
  attr OnLoadstart value = unsafeAttribute $ Left $  
    { key: "loadstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadstart (Event.Event  (Effect Unit) ) where
  attr OnLoadstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "loadstart", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnLoadstart  (Effect Boolean)  where
  attr OnLoadstart value = unsafeAttribute $ Left $  
    { key: "loadstart", value: cb' (Cb (const value)) }
instance Attr anything OnLoadstart (Event.Event  (Effect Boolean) ) where
  attr OnLoadstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "loadstart", value: cb' (Cb (const value)) }


instance Attr everything OnLoadstart  Unit  where
  attr OnLoadstart _ = unsafeAttribute $ Left $  
    { key: "loadstart", value: unset' }
instance Attr everything OnLoadstart (Event.Event  Unit ) where
  attr OnLoadstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "loadstart", value: unset' }
