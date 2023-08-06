module Deku.DOM.Attr.OnTouchstart where

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

data OnTouchstart = OnTouchstart

instance Attr anything OnTouchstart  Cb  where
  attr OnTouchstart value = unsafeAttribute $ Left $  
    { key: "touchstart", value: cb' value }
instance Attr anything OnTouchstart (Event.Event  Cb ) where
  attr OnTouchstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "touchstart", value: cb' value }


instance Attr anything OnTouchstart  (Effect Unit)  where
  attr OnTouchstart value = unsafeAttribute $ Left $  
    { key: "touchstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchstart (Event.Event  (Effect Unit) ) where
  attr OnTouchstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "touchstart", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTouchstart  (Effect Boolean)  where
  attr OnTouchstart value = unsafeAttribute $ Left $  
    { key: "touchstart", value: cb' (Cb (const value)) }
instance Attr anything OnTouchstart (Event.Event  (Effect Boolean) ) where
  attr OnTouchstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "touchstart", value: cb' (Cb (const value)) }


instance Attr everything OnTouchstart  Unit  where
  attr OnTouchstart _ = unsafeAttribute $ Left $  
    { key: "touchstart", value: unset' }
instance Attr everything OnTouchstart (Event.Event  Unit ) where
  attr OnTouchstart eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "touchstart", value: unset' }
