module Deku.DOM.Attr.OnLoad where

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

data OnLoad = OnLoad

instance Attr anything OnLoad  Cb  where
  attr OnLoad value = unsafeAttribute $ Left $  
    { key: "load", value: cb' value }
instance Attr anything OnLoad (Event.Event  Cb ) where
  attr OnLoad eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "load", value: cb' value }


instance Attr anything OnLoad  (Effect Unit)  where
  attr OnLoad value = unsafeAttribute $ Left $  
    { key: "load", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoad (Event.Event  (Effect Unit) ) where
  attr OnLoad eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "load", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnLoad  (Effect Boolean)  where
  attr OnLoad value = unsafeAttribute $ Left $  
    { key: "load", value: cb' (Cb (const value)) }
instance Attr anything OnLoad (Event.Event  (Effect Boolean) ) where
  attr OnLoad eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "load", value: cb' (Cb (const value)) }


instance Attr everything OnLoad  Unit  where
  attr OnLoad _ = unsafeAttribute $ Left $  { key: "load", value: unset' }
instance Attr everything OnLoad (Event.Event  Unit ) where
  attr OnLoad eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "load", value: unset' }
