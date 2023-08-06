module Deku.DOM.Attr.OnMouseenter where

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

data OnMouseenter = OnMouseenter

instance Attr anything OnMouseenter  Cb  where
  attr OnMouseenter value = unsafeAttribute $ Left $  
    { key: "mouseenter", value: cb' value }
instance Attr anything OnMouseenter (Event.Event  Cb ) where
  attr OnMouseenter eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseenter", value: cb' value }


instance Attr anything OnMouseenter  (Effect Unit)  where
  attr OnMouseenter value = unsafeAttribute $ Left $  
    { key: "mouseenter", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseenter (Event.Event  (Effect Unit) ) where
  attr OnMouseenter eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseenter", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnMouseenter  (Effect Boolean)  where
  attr OnMouseenter value = unsafeAttribute $ Left $  
    { key: "mouseenter", value: cb' (Cb (const value)) }
instance Attr anything OnMouseenter (Event.Event  (Effect Boolean) ) where
  attr OnMouseenter eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mouseenter", value: cb' (Cb (const value)) }


instance Attr everything OnMouseenter  Unit  where
  attr OnMouseenter _ = unsafeAttribute $ Left $  
    { key: "mouseenter", value: unset' }
instance Attr everything OnMouseenter (Event.Event  Unit ) where
  attr OnMouseenter eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "mouseenter", value: unset' }
