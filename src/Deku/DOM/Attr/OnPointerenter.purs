module Deku.DOM.Attr.OnPointerenter where

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

data OnPointerenter = OnPointerenter

instance Attr anything OnPointerenter  Cb  where
  attr OnPointerenter value = unsafeAttribute $ Left $  
    { key: "pointerenter", value: cb' value }
instance Attr anything OnPointerenter (Event.Event  Cb ) where
  attr OnPointerenter eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerenter", value: cb' value }


instance Attr anything OnPointerenter  (Effect Unit)  where
  attr OnPointerenter value = unsafeAttribute $ Left $  
    { key: "pointerenter", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerenter (Event.Event  (Effect Unit) ) where
  attr OnPointerenter eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerenter", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointerenter  (Effect Boolean)  where
  attr OnPointerenter value = unsafeAttribute $ Left $  
    { key: "pointerenter", value: cb' (Cb (const value)) }
instance Attr anything OnPointerenter (Event.Event  (Effect Boolean) ) where
  attr OnPointerenter eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerenter", value: cb' (Cb (const value)) }


instance Attr everything OnPointerenter  Unit  where
  attr OnPointerenter _ = unsafeAttribute $ Left $  
    { key: "pointerenter", value: unset' }
instance Attr everything OnPointerenter (Event.Event  Unit ) where
  attr OnPointerenter eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "pointerenter", value: unset' }
