module Deku.DOM.Attr.OnPointerout where

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

data OnPointerout = OnPointerout

instance Attr anything OnPointerout  Cb  where
  attr OnPointerout value = unsafeAttribute $ Left $  
    { key: "pointerout", value: cb' value }
instance Attr anything OnPointerout (Event.Event  Cb ) where
  attr OnPointerout eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerout", value: cb' value }


instance Attr anything OnPointerout  (Effect Unit)  where
  attr OnPointerout value = unsafeAttribute $ Left $  
    { key: "pointerout", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerout (Event.Event  (Effect Unit) ) where
  attr OnPointerout eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerout", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointerout  (Effect Boolean)  where
  attr OnPointerout value = unsafeAttribute $ Left $  
    { key: "pointerout", value: cb' (Cb (const value)) }
instance Attr anything OnPointerout (Event.Event  (Effect Boolean) ) where
  attr OnPointerout eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerout", value: cb' (Cb (const value)) }


instance Attr everything OnPointerout  Unit  where
  attr OnPointerout _ = unsafeAttribute $ Left $  
    { key: "pointerout", value: unset' }
instance Attr everything OnPointerout (Event.Event  Unit ) where
  attr OnPointerout eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "pointerout", value: unset' }
