module Deku.DOM.Attr.OnSelectstart where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSelectstart = OnSelectstart

instance Attr anything OnSelectstart  Cb  where
  attr OnSelectstart value = unsafeAttribute $ Left $  
    { key: "selectstart", value: cb' value }
instance Attr anything OnSelectstart (Event.Event  Cb ) where
  attr OnSelectstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "selectstart", value: cb' value }


instance Attr anything OnSelectstart  (Effect Unit)  where
  attr OnSelectstart value = unsafeAttribute $ Left $  
    { key: "selectstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelectstart (Event.Event  (Effect Unit) ) where
  attr OnSelectstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "selectstart", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnSelectstart  (Effect Boolean)  where
  attr OnSelectstart value = unsafeAttribute $ Left $  
    { key: "selectstart", value: cb' (Cb (const value)) }
instance Attr anything OnSelectstart (Event.Event  (Effect Boolean) ) where
  attr OnSelectstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "selectstart", value: cb' (Cb (const value)) }


instance Attr everything OnSelectstart  Unit  where
  attr OnSelectstart _ = unsafeAttribute $ Left $  
    { key: "selectstart", value: unset' }
instance Attr everything OnSelectstart (Event.Event  Unit ) where
  attr OnSelectstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "selectstart", value: unset' }
