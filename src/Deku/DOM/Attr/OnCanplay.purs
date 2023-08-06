module Deku.DOM.Attr.OnCanplay where

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

data OnCanplay = OnCanplay

instance Attr anything OnCanplay  Cb  where
  attr OnCanplay value = unsafeAttribute $ Left $  
    { key: "canplay", value: cb' value }
instance Attr anything OnCanplay (Event.Event  Cb ) where
  attr OnCanplay eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "canplay", value: cb' value }


instance Attr anything OnCanplay  (Effect Unit)  where
  attr OnCanplay value = unsafeAttribute $ Left $  
    { key: "canplay", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnCanplay (Event.Event  (Effect Unit) ) where
  attr OnCanplay eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "canplay", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnCanplay  (Effect Boolean)  where
  attr OnCanplay value = unsafeAttribute $ Left $  
    { key: "canplay", value: cb' (Cb (const value)) }
instance Attr anything OnCanplay (Event.Event  (Effect Boolean) ) where
  attr OnCanplay eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "canplay", value: cb' (Cb (const value)) }


instance Attr everything OnCanplay  Unit  where
  attr OnCanplay _ = unsafeAttribute $ Left $  
    { key: "canplay", value: unset' }
instance Attr everything OnCanplay (Event.Event  Unit ) where
  attr OnCanplay eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "canplay", value: unset' }
