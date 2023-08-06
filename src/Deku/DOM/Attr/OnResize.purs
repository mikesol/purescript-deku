module Deku.DOM.Attr.OnResize where

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

data OnResize = OnResize

instance Attr anything OnResize  Cb  where
  attr OnResize value = unsafeAttribute $ Left $  
    { key: "resize", value: cb' value }
instance Attr anything OnResize (Event.Event  Cb ) where
  attr OnResize eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "resize", value: cb' value }


instance Attr anything OnResize  (Effect Unit)  where
  attr OnResize value = unsafeAttribute $ Left $  
    { key: "resize", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnResize (Event.Event  (Effect Unit) ) where
  attr OnResize eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "resize", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnResize  (Effect Boolean)  where
  attr OnResize value = unsafeAttribute $ Left $  
    { key: "resize", value: cb' (Cb (const value)) }
instance Attr anything OnResize (Event.Event  (Effect Boolean) ) where
  attr OnResize eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "resize", value: cb' (Cb (const value)) }


instance Attr everything OnResize  Unit  where
  attr OnResize _ = unsafeAttribute $ Left $  { key: "resize", value: unset' }
instance Attr everything OnResize (Event.Event  Unit ) where
  attr OnResize eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "resize", value: unset' }
