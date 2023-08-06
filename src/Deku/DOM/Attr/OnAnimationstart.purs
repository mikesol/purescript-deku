module Deku.DOM.Attr.OnAnimationstart where

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

data OnAnimationstart = OnAnimationstart

instance Attr anything OnAnimationstart  Cb  where
  attr OnAnimationstart value = unsafeAttribute $ Left $  
    { key: "animationstart", value: cb' value }
instance Attr anything OnAnimationstart (Event.Event  Cb ) where
  attr OnAnimationstart eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "animationstart", value: cb' value }


instance Attr anything OnAnimationstart  (Effect Unit)  where
  attr OnAnimationstart value = unsafeAttribute $ Left $  
    { key: "animationstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationstart (Event.Event  (Effect Unit) ) where
  attr OnAnimationstart eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value ->
      { key: "animationstart", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnAnimationstart  (Effect Boolean)  where
  attr OnAnimationstart value = unsafeAttribute $ Left $  
    { key: "animationstart", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationstart (Event.Event  (Effect Boolean) ) where
  attr OnAnimationstart eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "animationstart", value: cb' (Cb (const value)) }


instance Attr everything OnAnimationstart  Unit  where
  attr OnAnimationstart _ = unsafeAttribute $ Left $  
    { key: "animationstart", value: unset' }
instance Attr everything OnAnimationstart (Event.Event  Unit ) where
  attr OnAnimationstart eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "animationstart", value: unset' }
