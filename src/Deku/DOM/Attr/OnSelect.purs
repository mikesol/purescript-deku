module Deku.DOM.Attr.OnSelect where

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

data OnSelect = OnSelect

instance Attr anything OnSelect  Cb  where
  attr OnSelect value = unsafeAttribute $ Left $  
    { key: "select", value: cb' value }
instance Attr anything OnSelect (Event.Event  Cb ) where
  attr OnSelect eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "select", value: cb' value }


instance Attr anything OnSelect  (Effect Unit)  where
  attr OnSelect value = unsafeAttribute $ Left $  
    { key: "select", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelect (Event.Event  (Effect Unit) ) where
  attr OnSelect eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "select", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnSelect  (Effect Boolean)  where
  attr OnSelect value = unsafeAttribute $ Left $  
    { key: "select", value: cb' (Cb (const value)) }
instance Attr anything OnSelect (Event.Event  (Effect Boolean) ) where
  attr OnSelect eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "select", value: cb' (Cb (const value)) }


instance Attr everything OnSelect  Unit  where
  attr OnSelect _ = unsafeAttribute $ Left $  { key: "select", value: unset' }
instance Attr everything OnSelect (Event.Event  Unit ) where
  attr OnSelect eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "select", value: unset' }
