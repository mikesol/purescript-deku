module Deku.DOM.Attr.OnSubmit where

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

data OnSubmit = OnSubmit

instance Attr anything OnSubmit  Cb  where
  attr OnSubmit value = unsafeAttribute $ Left $  
    { key: "submit", value: cb' value }
instance Attr anything OnSubmit (Event.Event  Cb ) where
  attr OnSubmit eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "submit", value: cb' value }


instance Attr anything OnSubmit  (Effect Unit)  where
  attr OnSubmit value = unsafeAttribute $ Left $  
    { key: "submit", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSubmit (Event.Event  (Effect Unit) ) where
  attr OnSubmit eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "submit", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnSubmit  (Effect Boolean)  where
  attr OnSubmit value = unsafeAttribute $ Left $  
    { key: "submit", value: cb' (Cb (const value)) }
instance Attr anything OnSubmit (Event.Event  (Effect Boolean) ) where
  attr OnSubmit eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "submit", value: cb' (Cb (const value)) }


instance Attr everything OnSubmit  Unit  where
  attr OnSubmit _ = unsafeAttribute $ Left $  { key: "submit", value: unset' }
instance Attr everything OnSubmit (Event.Event  Unit ) where
  attr OnSubmit eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "submit", value: unset' }
