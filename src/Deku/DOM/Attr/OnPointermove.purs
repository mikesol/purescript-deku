module Deku.DOM.Attr.OnPointermove where

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

data OnPointermove = OnPointermove

instance Attr anything OnPointermove  Cb  where
  attr OnPointermove value = unsafeAttribute $ Left $  
    { key: "pointermove", value: cb' value }
instance Attr anything OnPointermove (Event.Event  Cb ) where
  attr OnPointermove eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointermove", value: cb' value }


instance Attr anything OnPointermove  (Effect Unit)  where
  attr OnPointermove value = unsafeAttribute $ Left $  
    { key: "pointermove", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointermove (Event.Event  (Effect Unit) ) where
  attr OnPointermove eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointermove", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointermove  (Effect Boolean)  where
  attr OnPointermove value = unsafeAttribute $ Left $  
    { key: "pointermove", value: cb' (Cb (const value)) }
instance Attr anything OnPointermove (Event.Event  (Effect Boolean) ) where
  attr OnPointermove eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointermove", value: cb' (Cb (const value)) }


instance Attr everything OnPointermove  Unit  where
  attr OnPointermove _ = unsafeAttribute $ Left $  
    { key: "pointermove", value: unset' }
instance Attr everything OnPointermove (Event.Event  Unit ) where
  attr OnPointermove eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "pointermove", value: unset' }
