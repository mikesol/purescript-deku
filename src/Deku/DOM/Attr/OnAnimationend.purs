module Deku.DOM.Attr.OnAnimationend where

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

data OnAnimationend = OnAnimationend

instance Attr anything OnAnimationend  Cb  where
  attr OnAnimationend value = unsafeAttribute $ Left $  
    { key: "animationend", value: cb' value }
instance Attr anything OnAnimationend (Event.Event  Cb ) where
  attr OnAnimationend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "animationend", value: cb' value }


instance Attr anything OnAnimationend  (Effect Unit)  where
  attr OnAnimationend value = unsafeAttribute $ Left $  
    { key: "animationend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationend (Event.Event  (Effect Unit) ) where
  attr OnAnimationend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "animationend", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnAnimationend  (Effect Boolean)  where
  attr OnAnimationend value = unsafeAttribute $ Left $  
    { key: "animationend", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationend (Event.Event  (Effect Boolean) ) where
  attr OnAnimationend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "animationend", value: cb' (Cb (const value)) }


instance Attr everything OnAnimationend  Unit  where
  attr OnAnimationend _ = unsafeAttribute $ Left $  
    { key: "animationend", value: unset' }
instance Attr everything OnAnimationend (Event.Event  Unit ) where
  attr OnAnimationend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "animationend", value: unset' }
