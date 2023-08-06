module Deku.DOM.Attr.OnTransitionend where

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

data OnTransitionend = OnTransitionend

instance Attr anything OnTransitionend  Cb  where
  attr OnTransitionend value = unsafeAttribute $ Left $  
    { key: "transitionend", value: cb' value }
instance Attr anything OnTransitionend (Event.Event  Cb ) where
  attr OnTransitionend eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "transitionend", value: cb' value }


instance Attr anything OnTransitionend  (Effect Unit)  where
  attr OnTransitionend value = unsafeAttribute $ Left $  
    { key: "transitionend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionend (Event.Event  (Effect Unit) ) where
  attr OnTransitionend eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value ->
      { key: "transitionend", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTransitionend  (Effect Boolean)  where
  attr OnTransitionend value = unsafeAttribute $ Left $  
    { key: "transitionend", value: cb' (Cb (const value)) }
instance Attr anything OnTransitionend (Event.Event  (Effect Boolean) ) where
  attr OnTransitionend eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "transitionend", value: cb' (Cb (const value)) }


instance Attr everything OnTransitionend  Unit  where
  attr OnTransitionend _ = unsafeAttribute $ Left $  
    { key: "transitionend", value: unset' }
instance Attr everything OnTransitionend (Event.Event  Unit ) where
  attr OnTransitionend eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "transitionend", value: unset' }
