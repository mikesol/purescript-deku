module Deku.DOM.Attr.OnReset where

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

data OnReset = OnReset

instance Attr anything OnReset  Cb  where
  attr OnReset value = unsafeAttribute $ Left $  
    { key: "reset", value: cb' value }
instance Attr anything OnReset (Event.Event  Cb ) where
  attr OnReset eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "reset", value: cb' value }


instance Attr anything OnReset  (Effect Unit)  where
  attr OnReset value = unsafeAttribute $ Left $  
    { key: "reset", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnReset (Event.Event  (Effect Unit) ) where
  attr OnReset eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "reset", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnReset  (Effect Boolean)  where
  attr OnReset value = unsafeAttribute $ Left $  
    { key: "reset", value: cb' (Cb (const value)) }
instance Attr anything OnReset (Event.Event  (Effect Boolean) ) where
  attr OnReset eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "reset", value: cb' (Cb (const value)) }


instance Attr everything OnReset  Unit  where
  attr OnReset _ = unsafeAttribute $ Left $  { key: "reset", value: unset' }
instance Attr everything OnReset (Event.Event  Unit ) where
  attr OnReset eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "reset", value: unset' }
