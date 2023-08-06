module Deku.DOM.Attr.OnAbort where

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

data OnAbort = OnAbort

instance Attr anything OnAbort  Cb  where
  attr OnAbort value = unsafeAttribute $ Left $  
    { key: "abort", value: cb' value }
instance Attr anything OnAbort (Event.Event  Cb ) where
  attr OnAbort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "abort", value: cb' value }


instance Attr anything OnAbort  (Effect Unit)  where
  attr OnAbort value = unsafeAttribute $ Left $  
    { key: "abort", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAbort (Event.Event  (Effect Unit) ) where
  attr OnAbort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "abort", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnAbort  (Effect Boolean)  where
  attr OnAbort value = unsafeAttribute $ Left $  
    { key: "abort", value: cb' (Cb (const value)) }
instance Attr anything OnAbort (Event.Event  (Effect Boolean) ) where
  attr OnAbort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "abort", value: cb' (Cb (const value)) }


instance Attr everything OnAbort  Unit  where
  attr OnAbort _ = unsafeAttribute $ Left $  { key: "abort", value: unset' }
instance Attr everything OnAbort (Event.Event  Unit ) where
  attr OnAbort eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "abort", value: unset' }
