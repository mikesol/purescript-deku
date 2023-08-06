module Deku.DOM.Attr.OnInput where

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

data OnInput = OnInput

instance Attr anything OnInput  Cb  where
  attr OnInput value = unsafeAttribute $ Left $  
    { key: "input", value: cb' value }
instance Attr anything OnInput (Event.Event  Cb ) where
  attr OnInput eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "input", value: cb' value }


instance Attr anything OnInput  (Effect Unit)  where
  attr OnInput value = unsafeAttribute $ Left $  
    { key: "input", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnInput (Event.Event  (Effect Unit) ) where
  attr OnInput eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "input", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnInput  (Effect Boolean)  where
  attr OnInput value = unsafeAttribute $ Left $  
    { key: "input", value: cb' (Cb (const value)) }
instance Attr anything OnInput (Event.Event  (Effect Boolean) ) where
  attr OnInput eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "input", value: cb' (Cb (const value)) }


instance Attr everything OnInput  Unit  where
  attr OnInput _ = unsafeAttribute $ Left $  { key: "input", value: unset' }
instance Attr everything OnInput (Event.Event  Unit ) where
  attr OnInput eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "input", value: unset' }
