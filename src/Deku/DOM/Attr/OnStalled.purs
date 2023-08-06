module Deku.DOM.Attr.OnStalled where

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

data OnStalled = OnStalled

instance Attr anything OnStalled  Cb  where
  attr OnStalled value = unsafeAttribute $ Left $  
    { key: "stalled", value: cb' value }
instance Attr anything OnStalled (Event.Event  Cb ) where
  attr OnStalled eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "stalled", value: cb' value }


instance Attr anything OnStalled  (Effect Unit)  where
  attr OnStalled value = unsafeAttribute $ Left $  
    { key: "stalled", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnStalled (Event.Event  (Effect Unit) ) where
  attr OnStalled eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "stalled", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnStalled  (Effect Boolean)  where
  attr OnStalled value = unsafeAttribute $ Left $  
    { key: "stalled", value: cb' (Cb (const value)) }
instance Attr anything OnStalled (Event.Event  (Effect Boolean) ) where
  attr OnStalled eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "stalled", value: cb' (Cb (const value)) }


instance Attr everything OnStalled  Unit  where
  attr OnStalled _ = unsafeAttribute $ Left $  
    { key: "stalled", value: unset' }
instance Attr everything OnStalled (Event.Event  Unit ) where
  attr OnStalled eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "stalled", value: unset' }
