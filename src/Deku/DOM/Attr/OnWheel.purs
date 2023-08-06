module Deku.DOM.Attr.OnWheel where

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

data OnWheel = OnWheel

instance Attr anything OnWheel  Cb  where
  attr OnWheel value = unsafeAttribute $ Left $  
    { key: "wheel", value: cb' value }
instance Attr anything OnWheel (Event.Event  Cb ) where
  attr OnWheel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "wheel", value: cb' value }


instance Attr anything OnWheel  (Effect Unit)  where
  attr OnWheel value = unsafeAttribute $ Left $  
    { key: "wheel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnWheel (Event.Event  (Effect Unit) ) where
  attr OnWheel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "wheel", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnWheel  (Effect Boolean)  where
  attr OnWheel value = unsafeAttribute $ Left $  
    { key: "wheel", value: cb' (Cb (const value)) }
instance Attr anything OnWheel (Event.Event  (Effect Boolean) ) where
  attr OnWheel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "wheel", value: cb' (Cb (const value)) }


instance Attr everything OnWheel  Unit  where
  attr OnWheel _ = unsafeAttribute $ Left $  { key: "wheel", value: unset' }
instance Attr everything OnWheel (Event.Event  Unit ) where
  attr OnWheel eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "wheel", value: unset' }
