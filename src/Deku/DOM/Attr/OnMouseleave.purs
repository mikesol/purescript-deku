module Deku.DOM.Attr.OnMouseleave where

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

data OnMouseleave = OnMouseleave

instance Attr anything OnMouseleave  Cb  where
  attr OnMouseleave value = unsafeAttribute $ Left $  
    { key: "mouseleave", value: cb' value }
instance Attr anything OnMouseleave (Event.Event  Cb ) where
  attr OnMouseleave eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseleave", value: cb' value }


instance Attr anything OnMouseleave  (Effect Unit)  where
  attr OnMouseleave value = unsafeAttribute $ Left $  
    { key: "mouseleave", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseleave (Event.Event  (Effect Unit) ) where
  attr OnMouseleave eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseleave", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnMouseleave  (Effect Boolean)  where
  attr OnMouseleave value = unsafeAttribute $ Left $  
    { key: "mouseleave", value: cb' (Cb (const value)) }
instance Attr anything OnMouseleave (Event.Event  (Effect Boolean) ) where
  attr OnMouseleave eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseleave", value: cb' (Cb (const value)) }


instance Attr everything OnMouseleave  Unit  where
  attr OnMouseleave _ = unsafeAttribute $ Left $  
    { key: "mouseleave", value: unset' }
instance Attr everything OnMouseleave (Event.Event  Unit ) where
  attr OnMouseleave eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "mouseleave", value: unset' }
