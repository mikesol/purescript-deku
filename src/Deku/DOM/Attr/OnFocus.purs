module Deku.DOM.Attr.OnFocus where

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

data OnFocus = OnFocus

instance Attr anything OnFocus  Cb  where
  attr OnFocus value = unsafeAttribute $ Left $  
    { key: "focus", value: cb' value }
instance Attr anything OnFocus (Event.Event  Cb ) where
  attr OnFocus eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "focus", value: cb' value }


instance Attr anything OnFocus  (Effect Unit)  where
  attr OnFocus value = unsafeAttribute $ Left $  
    { key: "focus", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnFocus (Event.Event  (Effect Unit) ) where
  attr OnFocus eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "focus", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnFocus  (Effect Boolean)  where
  attr OnFocus value = unsafeAttribute $ Left $  
    { key: "focus", value: cb' (Cb (const value)) }
instance Attr anything OnFocus (Event.Event  (Effect Boolean) ) where
  attr OnFocus eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "focus", value: cb' (Cb (const value)) }


instance Attr everything OnFocus  Unit  where
  attr OnFocus _ = unsafeAttribute $ Left $  { key: "focus", value: unset' }
instance Attr everything OnFocus (Event.Event  Unit ) where
  attr OnFocus eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "focus", value: unset' }
