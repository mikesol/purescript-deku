module Deku.DOM.Attr.OnError where

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

data OnError = OnError

instance Attr anything OnError  Cb  where
  attr OnError value = unsafeAttribute $ Left $  
    { key: "error", value: cb' value }
instance Attr anything OnError (Event.Event  Cb ) where
  attr OnError eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "error", value: cb' value }


instance Attr anything OnError  (Effect Unit)  where
  attr OnError value = unsafeAttribute $ Left $  
    { key: "error", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnError (Event.Event  (Effect Unit) ) where
  attr OnError eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "error", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnError  (Effect Boolean)  where
  attr OnError value = unsafeAttribute $ Left $  
    { key: "error", value: cb' (Cb (const value)) }
instance Attr anything OnError (Event.Event  (Effect Boolean) ) where
  attr OnError eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "error", value: cb' (Cb (const value)) }


instance Attr everything OnError  Unit  where
  attr OnError _ = unsafeAttribute $ Left $  { key: "error", value: unset' }
instance Attr everything OnError (Event.Event  Unit ) where
  attr OnError eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "error", value: unset' }
