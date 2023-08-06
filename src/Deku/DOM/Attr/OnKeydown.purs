module Deku.DOM.Attr.OnKeydown where

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

data OnKeydown = OnKeydown

instance Attr anything OnKeydown  Cb  where
  attr OnKeydown value = unsafeAttribute $ Left $  
    { key: "keydown", value: cb' value }
instance Attr anything OnKeydown (Event.Event  Cb ) where
  attr OnKeydown eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keydown", value: cb' value }


instance Attr anything OnKeydown  (Effect Unit)  where
  attr OnKeydown value = unsafeAttribute $ Left $  
    { key: "keydown", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnKeydown (Event.Event  (Effect Unit) ) where
  attr OnKeydown eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keydown", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnKeydown  (Effect Boolean)  where
  attr OnKeydown value = unsafeAttribute $ Left $  
    { key: "keydown", value: cb' (Cb (const value)) }
instance Attr anything OnKeydown (Event.Event  (Effect Boolean) ) where
  attr OnKeydown eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keydown", value: cb' (Cb (const value)) }


instance Attr everything OnKeydown  Unit  where
  attr OnKeydown _ = unsafeAttribute $ Left $  
    { key: "keydown", value: unset' }
instance Attr everything OnKeydown (Event.Event  Unit ) where
  attr OnKeydown eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "keydown", value: unset' }
