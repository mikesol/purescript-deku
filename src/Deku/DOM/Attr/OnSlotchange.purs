module Deku.DOM.Attr.OnSlotchange where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSlotchange = OnSlotchange

instance Attr anything OnSlotchange  Cb  where
  attr OnSlotchange value = unsafeAttribute $ Left $  
    { key: "slotchange", value: cb' value }
instance Attr anything OnSlotchange (Event.Event  Cb ) where
  attr OnSlotchange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "slotchange", value: cb' value }


instance Attr anything OnSlotchange  (Effect Unit)  where
  attr OnSlotchange value = unsafeAttribute $ Left $  
    { key: "slotchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSlotchange (Event.Event  (Effect Unit) ) where
  attr OnSlotchange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "slotchange", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnSlotchange  (Effect Boolean)  where
  attr OnSlotchange value = unsafeAttribute $ Left $  
    { key: "slotchange", value: cb' (Cb (const value)) }
instance Attr anything OnSlotchange (Event.Event  (Effect Boolean) ) where
  attr OnSlotchange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "slotchange", value: cb' (Cb (const value)) }


instance Attr everything OnSlotchange  Unit  where
  attr OnSlotchange _ = unsafeAttribute $ Left $  
    { key: "slotchange", value: unset' }
instance Attr everything OnSlotchange (Event.Event  Unit ) where
  attr OnSlotchange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "slotchange", value: unset' }
