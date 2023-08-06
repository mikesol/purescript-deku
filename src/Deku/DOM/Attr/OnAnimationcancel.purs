module Deku.DOM.Attr.OnAnimationcancel where

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

data OnAnimationcancel = OnAnimationcancel

instance Attr anything OnAnimationcancel  Cb  where
  attr OnAnimationcancel value = unsafeAttribute $ Left $  
    { key: "animationcancel", value: cb' value }
instance Attr anything OnAnimationcancel (Event.Event  Cb ) where
  attr OnAnimationcancel eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "animationcancel", value: cb' value }


instance Attr anything OnAnimationcancel  (Effect Unit)  where
  attr OnAnimationcancel value = unsafeAttribute $ Left $  
    { key: "animationcancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationcancel (Event.Event  (Effect Unit) ) where
  attr OnAnimationcancel eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value ->
      { key: "animationcancel", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnAnimationcancel  (Effect Boolean)  where
  attr OnAnimationcancel value = unsafeAttribute $ Left $  
    { key: "animationcancel", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationcancel (Event.Event  (Effect Boolean) ) where
  attr OnAnimationcancel eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "animationcancel", value: cb' (Cb (const value)) }


instance Attr everything OnAnimationcancel  Unit  where
  attr OnAnimationcancel _ = unsafeAttribute $ Left $  
    { key: "animationcancel", value: unset' }
instance Attr everything OnAnimationcancel (Event.Event  Unit ) where
  attr OnAnimationcancel eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "animationcancel", value: unset' }
