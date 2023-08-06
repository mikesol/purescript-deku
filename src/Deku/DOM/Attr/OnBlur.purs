module Deku.DOM.Attr.OnBlur where

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

data OnBlur = OnBlur

instance Attr anything OnBlur  Cb  where
  attr OnBlur value = unsafeAttribute $ Left $  
    { key: "blur", value: cb' value }
instance Attr anything OnBlur (Event.Event  Cb ) where
  attr OnBlur eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "blur", value: cb' value }


instance Attr anything OnBlur  (Effect Unit)  where
  attr OnBlur value = unsafeAttribute $ Left $  
    { key: "blur", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnBlur (Event.Event  (Effect Unit) ) where
  attr OnBlur eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "blur", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnBlur  (Effect Boolean)  where
  attr OnBlur value = unsafeAttribute $ Left $  
    { key: "blur", value: cb' (Cb (const value)) }
instance Attr anything OnBlur (Event.Event  (Effect Boolean) ) where
  attr OnBlur eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "blur", value: cb' (Cb (const value)) }


instance Attr everything OnBlur  Unit  where
  attr OnBlur _ = unsafeAttribute $ Left $  { key: "blur", value: unset' }
instance Attr everything OnBlur (Event.Event  Unit ) where
  attr OnBlur eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "blur", value: unset' }
