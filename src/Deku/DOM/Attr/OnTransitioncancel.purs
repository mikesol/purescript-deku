module Deku.DOM.Attr.OnTransitioncancel where

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

data OnTransitioncancel = OnTransitioncancel

instance Attr anything OnTransitioncancel  Cb  where
  attr OnTransitioncancel value = unsafeAttribute $ Left $  
    { key: "transitioncancel", value: cb' value }
instance Attr anything OnTransitioncancel (Event.Event  Cb ) where
  attr OnTransitioncancel eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "transitioncancel", value: cb' value }


instance Attr anything OnTransitioncancel  (Effect Unit)  where
  attr OnTransitioncancel value = unsafeAttribute $ Left $  
    { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitioncancel (Event.Event  (Effect Unit) ) where
  attr OnTransitioncancel eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value ->
      { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTransitioncancel  (Effect Boolean)  where
  attr OnTransitioncancel value = unsafeAttribute $ Left $  
    { key: "transitioncancel", value: cb' (Cb (const value)) }
instance Attr anything OnTransitioncancel (Event.Event  (Effect Boolean) ) where
  attr OnTransitioncancel eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "transitioncancel", value: cb' (Cb (const value)) }


instance Attr everything OnTransitioncancel  Unit  where
  attr OnTransitioncancel _ = unsafeAttribute $ Left $  
    { key: "transitioncancel", value: unset' }
instance Attr everything OnTransitioncancel (Event.Event  Unit ) where
  attr OnTransitioncancel eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "transitioncancel", value: unset' }
