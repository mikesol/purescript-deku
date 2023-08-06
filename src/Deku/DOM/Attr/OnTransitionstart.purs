module Deku.DOM.Attr.OnTransitionstart where

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

data OnTransitionstart = OnTransitionstart

instance Attr anything OnTransitionstart  Cb  where
  attr OnTransitionstart value = unsafeAttribute $ Left $  
    { key: "transitionstart", value: cb' value }
instance Attr anything OnTransitionstart (Event.Event  Cb ) where
  attr OnTransitionstart eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "transitionstart", value: cb' value }


instance Attr anything OnTransitionstart  (Effect Unit)  where
  attr OnTransitionstart value = unsafeAttribute $ Left $  
    { key: "transitionstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionstart (Event.Event  (Effect Unit) ) where
  attr OnTransitionstart eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value ->
      { key: "transitionstart", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTransitionstart  (Effect Boolean)  where
  attr OnTransitionstart value = unsafeAttribute $ Left $  
    { key: "transitionstart", value: cb' (Cb (const value)) }
instance Attr anything OnTransitionstart (Event.Event  (Effect Boolean) ) where
  attr OnTransitionstart eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "transitionstart", value: cb' (Cb (const value)) }


instance Attr everything OnTransitionstart  Unit  where
  attr OnTransitionstart _ = unsafeAttribute $ Left $  
    { key: "transitionstart", value: unset' }
instance Attr everything OnTransitionstart (Event.Event  Unit ) where
  attr OnTransitionstart eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "transitionstart", value: unset' }
