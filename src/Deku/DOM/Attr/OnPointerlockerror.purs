module Deku.DOM.Attr.OnPointerlockerror where

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

data OnPointerlockerror = OnPointerlockerror

instance Attr anything OnPointerlockerror  Cb  where
  attr OnPointerlockerror value = unsafeAttribute $ Left $  
    { key: "pointerlockerror", value: cb' value }
instance Attr anything OnPointerlockerror (Event.Event  Cb ) where
  attr OnPointerlockerror eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "pointerlockerror", value: cb' value }


instance Attr anything OnPointerlockerror  (Effect Unit)  where
  attr OnPointerlockerror value = unsafeAttribute $ Left $  
    { key: "pointerlockerror", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerlockerror (Event.Event  (Effect Unit) ) where
  attr OnPointerlockerror eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value ->
      { key: "pointerlockerror", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointerlockerror  (Effect Boolean)  where
  attr OnPointerlockerror value = unsafeAttribute $ Left $  
    { key: "pointerlockerror", value: cb' (Cb (const value)) }
instance Attr anything OnPointerlockerror (Event.Event  (Effect Boolean) ) where
  attr OnPointerlockerror eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "pointerlockerror", value: cb' (Cb (const value)) }


instance Attr everything OnPointerlockerror  Unit  where
  attr OnPointerlockerror _ = unsafeAttribute $ Left $  
    { key: "pointerlockerror", value: unset' }
instance Attr everything OnPointerlockerror (Event.Event  Unit ) where
  attr OnPointerlockerror eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "pointerlockerror", value: unset' }
