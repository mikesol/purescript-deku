module Deku.DOM.Attr.OnDrag where

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

data OnDrag = OnDrag

instance Attr anything OnDrag  Cb  where
  attr OnDrag value = unsafeAttribute $ Left $  
    { key: "drag", value: cb' value }
instance Attr anything OnDrag (Event.Event  Cb ) where
  attr OnDrag eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "drag", value: cb' value }


instance Attr anything OnDrag  (Effect Unit)  where
  attr OnDrag value = unsafeAttribute $ Left $  
    { key: "drag", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDrag (Event.Event  (Effect Unit) ) where
  attr OnDrag eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "drag", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDrag  (Effect Boolean)  where
  attr OnDrag value = unsafeAttribute $ Left $  
    { key: "drag", value: cb' (Cb (const value)) }
instance Attr anything OnDrag (Event.Event  (Effect Boolean) ) where
  attr OnDrag eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "drag", value: cb' (Cb (const value)) }


instance Attr everything OnDrag  Unit  where
  attr OnDrag _ = unsafeAttribute $ Left $  { key: "drag", value: unset' }
instance Attr everything OnDrag (Event.Event  Unit ) where
  attr OnDrag eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "drag", value: unset' }
