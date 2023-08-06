module Deku.DOM.Attr.OnTransitionrun where

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

data OnTransitionrun = OnTransitionrun

instance Attr anything OnTransitionrun  Cb  where
  attr OnTransitionrun value = unsafeAttribute $ Left $  
    { key: "transitionrun", value: cb' value }
instance Attr anything OnTransitionrun (Event.Event  Cb ) where
  attr OnTransitionrun eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "transitionrun", value: cb' value }


instance Attr anything OnTransitionrun  (Effect Unit)  where
  attr OnTransitionrun value = unsafeAttribute $ Left $  
    { key: "transitionrun", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionrun (Event.Event  (Effect Unit) ) where
  attr OnTransitionrun eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value ->
      { key: "transitionrun", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTransitionrun  (Effect Boolean)  where
  attr OnTransitionrun value = unsafeAttribute $ Left $  
    { key: "transitionrun", value: cb' (Cb (const value)) }
instance Attr anything OnTransitionrun (Event.Event  (Effect Boolean) ) where
  attr OnTransitionrun eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "transitionrun", value: cb' (Cb (const value)) }


instance Attr everything OnTransitionrun  Unit  where
  attr OnTransitionrun _ = unsafeAttribute $ Left $  
    { key: "transitionrun", value: unset' }
instance Attr everything OnTransitionrun (Event.Event  Unit ) where
  attr OnTransitionrun eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "transitionrun", value: unset' }
