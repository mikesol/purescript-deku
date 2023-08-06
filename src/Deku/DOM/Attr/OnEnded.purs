module Deku.DOM.Attr.OnEnded where

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

data OnEnded = OnEnded

instance Attr anything OnEnded  Cb  where
  attr OnEnded value = unsafeAttribute $ Left $  
    { key: "ended", value: cb' value }
instance Attr anything OnEnded (Event.Event  Cb ) where
  attr OnEnded eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "ended", value: cb' value }


instance Attr anything OnEnded  (Effect Unit)  where
  attr OnEnded value = unsafeAttribute $ Left $  
    { key: "ended", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnEnded (Event.Event  (Effect Unit) ) where
  attr OnEnded eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "ended", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnEnded  (Effect Boolean)  where
  attr OnEnded value = unsafeAttribute $ Left $  
    { key: "ended", value: cb' (Cb (const value)) }
instance Attr anything OnEnded (Event.Event  (Effect Boolean) ) where
  attr OnEnded eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "ended", value: cb' (Cb (const value)) }


instance Attr everything OnEnded  Unit  where
  attr OnEnded _ = unsafeAttribute $ Left $  { key: "ended", value: unset' }
instance Attr everything OnEnded (Event.Event  Unit ) where
  attr OnEnded eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "ended", value: unset' }
