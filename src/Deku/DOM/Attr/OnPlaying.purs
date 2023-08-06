module Deku.DOM.Attr.OnPlaying where

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

data OnPlaying = OnPlaying

instance Attr anything OnPlaying  Cb  where
  attr OnPlaying value = unsafeAttribute $ Left $  
    { key: "playing", value: cb' value }
instance Attr anything OnPlaying (Event.Event  Cb ) where
  attr OnPlaying eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "playing", value: cb' value }


instance Attr anything OnPlaying  (Effect Unit)  where
  attr OnPlaying value = unsafeAttribute $ Left $  
    { key: "playing", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPlaying (Event.Event  (Effect Unit) ) where
  attr OnPlaying eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "playing", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPlaying  (Effect Boolean)  where
  attr OnPlaying value = unsafeAttribute $ Left $  
    { key: "playing", value: cb' (Cb (const value)) }
instance Attr anything OnPlaying (Event.Event  (Effect Boolean) ) where
  attr OnPlaying eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "playing", value: cb' (Cb (const value)) }


instance Attr everything OnPlaying  Unit  where
  attr OnPlaying _ = unsafeAttribute $ Left $  
    { key: "playing", value: unset' }
instance Attr everything OnPlaying (Event.Event  Unit ) where
  attr OnPlaying eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "playing", value: unset' }
