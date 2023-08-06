module Deku.DOM.Attr.OnMousewheel where

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

data OnMousewheel = OnMousewheel

instance Attr anything OnMousewheel  Cb  where
  attr OnMousewheel value = unsafeAttribute $ Left $  
    { key: "mousewheel", value: cb' value }
instance Attr anything OnMousewheel (Event.Event  Cb ) where
  attr OnMousewheel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mousewheel", value: cb' value }


instance Attr anything OnMousewheel  (Effect Unit)  where
  attr OnMousewheel value = unsafeAttribute $ Left $  
    { key: "mousewheel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMousewheel (Event.Event  (Effect Unit) ) where
  attr OnMousewheel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mousewheel", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnMousewheel  (Effect Boolean)  where
  attr OnMousewheel value = unsafeAttribute $ Left $  
    { key: "mousewheel", value: cb' (Cb (const value)) }
instance Attr anything OnMousewheel (Event.Event  (Effect Boolean) ) where
  attr OnMousewheel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "mousewheel", value: cb' (Cb (const value)) }


instance Attr everything OnMousewheel  Unit  where
  attr OnMousewheel _ = unsafeAttribute $ Left $  
    { key: "mousewheel", value: unset' }
instance Attr everything OnMousewheel (Event.Event  Unit ) where
  attr OnMousewheel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "mousewheel", value: unset' }
