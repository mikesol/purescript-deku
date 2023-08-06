module Deku.DOM.Attr.OnScroll where

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

data OnScroll = OnScroll

instance Attr anything OnScroll  Cb  where
  attr OnScroll value = unsafeAttribute $ Left $  
    { key: "scroll", value: cb' value }
instance Attr anything OnScroll (Event.Event  Cb ) where
  attr OnScroll eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "scroll", value: cb' value }


instance Attr anything OnScroll  (Effect Unit)  where
  attr OnScroll value = unsafeAttribute $ Left $  
    { key: "scroll", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnScroll (Event.Event  (Effect Unit) ) where
  attr OnScroll eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "scroll", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnScroll  (Effect Boolean)  where
  attr OnScroll value = unsafeAttribute $ Left $  
    { key: "scroll", value: cb' (Cb (const value)) }
instance Attr anything OnScroll (Event.Event  (Effect Boolean) ) where
  attr OnScroll eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "scroll", value: cb' (Cb (const value)) }


instance Attr everything OnScroll  Unit  where
  attr OnScroll _ = unsafeAttribute $ Left $  { key: "scroll", value: unset' }
instance Attr everything OnScroll (Event.Event  Unit ) where
  attr OnScroll eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "scroll", value: unset' }
