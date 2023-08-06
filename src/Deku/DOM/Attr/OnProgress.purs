module Deku.DOM.Attr.OnProgress where

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

data OnProgress = OnProgress

instance Attr anything OnProgress  Cb  where
  attr OnProgress value = unsafeAttribute $ Left $  
    { key: "progress", value: cb' value }
instance Attr anything OnProgress (Event.Event  Cb ) where
  attr OnProgress eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "progress", value: cb' value }


instance Attr anything OnProgress  (Effect Unit)  where
  attr OnProgress value = unsafeAttribute $ Left $  
    { key: "progress", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnProgress (Event.Event  (Effect Unit) ) where
  attr OnProgress eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "progress", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnProgress  (Effect Boolean)  where
  attr OnProgress value = unsafeAttribute $ Left $  
    { key: "progress", value: cb' (Cb (const value)) }
instance Attr anything OnProgress (Event.Event  (Effect Boolean) ) where
  attr OnProgress eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "progress", value: cb' (Cb (const value)) }


instance Attr everything OnProgress  Unit  where
  attr OnProgress _ = unsafeAttribute $ Left $  
    { key: "progress", value: unset' }
instance Attr everything OnProgress (Event.Event  Unit ) where
  attr OnProgress eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "progress", value: unset' }
