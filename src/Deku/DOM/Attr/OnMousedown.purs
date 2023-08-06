module Deku.DOM.Attr.OnMousedown where

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

data OnMousedown = OnMousedown

instance Attr anything OnMousedown  Cb  where
  attr OnMousedown value = unsafeAttribute $ Left $  
    { key: "mousedown", value: cb' value }
instance Attr anything OnMousedown (Event.Event  Cb ) where
  attr OnMousedown eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mousedown", value: cb' value }


instance Attr anything OnMousedown  (Effect Unit)  where
  attr OnMousedown value = unsafeAttribute $ Left $  
    { key: "mousedown", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMousedown (Event.Event  (Effect Unit) ) where
  attr OnMousedown eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mousedown", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnMousedown  (Effect Boolean)  where
  attr OnMousedown value = unsafeAttribute $ Left $  
    { key: "mousedown", value: cb' (Cb (const value)) }
instance Attr anything OnMousedown (Event.Event  (Effect Boolean) ) where
  attr OnMousedown eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mousedown", value: cb' (Cb (const value)) }


instance Attr everything OnMousedown  Unit  where
  attr OnMousedown _ = unsafeAttribute $ Left $  
    { key: "mousedown", value: unset' }
instance Attr everything OnMousedown (Event.Event  Unit ) where
  attr OnMousedown eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "mousedown", value: unset' }
