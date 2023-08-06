module Deku.DOM.Attr.OnSeeked where

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

data OnSeeked = OnSeeked

instance Attr anything OnSeeked  Cb  where
  attr OnSeeked value = unsafeAttribute $ Left $  
    { key: "seeked", value: cb' value }
instance Attr anything OnSeeked (Event.Event  Cb ) where
  attr OnSeeked eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "seeked", value: cb' value }


instance Attr anything OnSeeked  (Effect Unit)  where
  attr OnSeeked value = unsafeAttribute $ Left $  
    { key: "seeked", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSeeked (Event.Event  (Effect Unit) ) where
  attr OnSeeked eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "seeked", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnSeeked  (Effect Boolean)  where
  attr OnSeeked value = unsafeAttribute $ Left $  
    { key: "seeked", value: cb' (Cb (const value)) }
instance Attr anything OnSeeked (Event.Event  (Effect Boolean) ) where
  attr OnSeeked eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "seeked", value: cb' (Cb (const value)) }


instance Attr everything OnSeeked  Unit  where
  attr OnSeeked _ = unsafeAttribute $ Left $  { key: "seeked", value: unset' }
instance Attr everything OnSeeked (Event.Event  Unit ) where
  attr OnSeeked eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "seeked", value: unset' }
