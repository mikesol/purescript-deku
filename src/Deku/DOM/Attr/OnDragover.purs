module Deku.DOM.Attr.OnDragover where

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

data OnDragover = OnDragover

instance Attr anything OnDragover  Cb  where
  attr OnDragover value = unsafeAttribute $ Left $  
    { key: "dragover", value: cb' value }
instance Attr anything OnDragover (Event.Event  Cb ) where
  attr OnDragover eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragover", value: cb' value }


instance Attr anything OnDragover  (Effect Unit)  where
  attr OnDragover value = unsafeAttribute $ Left $  
    { key: "dragover", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragover (Event.Event  (Effect Unit) ) where
  attr OnDragover eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragover", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDragover  (Effect Boolean)  where
  attr OnDragover value = unsafeAttribute $ Left $  
    { key: "dragover", value: cb' (Cb (const value)) }
instance Attr anything OnDragover (Event.Event  (Effect Boolean) ) where
  attr OnDragover eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragover", value: cb' (Cb (const value)) }


instance Attr everything OnDragover  Unit  where
  attr OnDragover _ = unsafeAttribute $ Left $  
    { key: "dragover", value: unset' }
instance Attr everything OnDragover (Event.Event  Unit ) where
  attr OnDragover eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "dragover", value: unset' }
