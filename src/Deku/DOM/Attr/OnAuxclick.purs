module Deku.DOM.Attr.OnAuxclick where

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

data OnAuxclick = OnAuxclick

instance Attr anything OnAuxclick  Cb  where
  attr OnAuxclick value = unsafeAttribute $ Left $  
    { key: "auxclick", value: cb' value }
instance Attr anything OnAuxclick (Event.Event  Cb ) where
  attr OnAuxclick eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "auxclick", value: cb' value }


instance Attr anything OnAuxclick  (Effect Unit)  where
  attr OnAuxclick value = unsafeAttribute $ Left $  
    { key: "auxclick", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAuxclick (Event.Event  (Effect Unit) ) where
  attr OnAuxclick eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "auxclick", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnAuxclick  (Effect Boolean)  where
  attr OnAuxclick value = unsafeAttribute $ Left $  
    { key: "auxclick", value: cb' (Cb (const value)) }
instance Attr anything OnAuxclick (Event.Event  (Effect Boolean) ) where
  attr OnAuxclick eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "auxclick", value: cb' (Cb (const value)) }


instance Attr everything OnAuxclick  Unit  where
  attr OnAuxclick _ = unsafeAttribute $ Left $  
    { key: "auxclick", value: unset' }
instance Attr everything OnAuxclick (Event.Event  Unit ) where
  attr OnAuxclick eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "auxclick", value: unset' }
