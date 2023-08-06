module Deku.DOM.Attr.OnPointerover where

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

data OnPointerover = OnPointerover

instance Attr anything OnPointerover  Cb  where
  attr OnPointerover value = unsafeAttribute $ Left $  
    { key: "pointerover", value: cb' value }
instance Attr anything OnPointerover (Event.Event  Cb ) where
  attr OnPointerover eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerover", value: cb' value }


instance Attr anything OnPointerover  (Effect Unit)  where
  attr OnPointerover value = unsafeAttribute $ Left $  
    { key: "pointerover", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerover (Event.Event  (Effect Unit) ) where
  attr OnPointerover eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerover", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointerover  (Effect Boolean)  where
  attr OnPointerover value = unsafeAttribute $ Left $  
    { key: "pointerover", value: cb' (Cb (const value)) }
instance Attr anything OnPointerover (Event.Event  (Effect Boolean) ) where
  attr OnPointerover eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerover", value: cb' (Cb (const value)) }


instance Attr everything OnPointerover  Unit  where
  attr OnPointerover _ = unsafeAttribute $ Left $  
    { key: "pointerover", value: unset' }
instance Attr everything OnPointerover (Event.Event  Unit ) where
  attr OnPointerover eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "pointerover", value: unset' }
