module Deku.DOM.Attr.OnDblclick where

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

data OnDblclick = OnDblclick

instance Attr anything OnDblclick  Cb  where
  attr OnDblclick value = unsafeAttribute $ Left $  
    { key: "dblclick", value: cb' value }
instance Attr anything OnDblclick (Event.Event  Cb ) where
  attr OnDblclick eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dblclick", value: cb' value }


instance Attr anything OnDblclick  (Effect Unit)  where
  attr OnDblclick value = unsafeAttribute $ Left $  
    { key: "dblclick", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDblclick (Event.Event  (Effect Unit) ) where
  attr OnDblclick eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dblclick", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDblclick  (Effect Boolean)  where
  attr OnDblclick value = unsafeAttribute $ Left $  
    { key: "dblclick", value: cb' (Cb (const value)) }
instance Attr anything OnDblclick (Event.Event  (Effect Boolean) ) where
  attr OnDblclick eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dblclick", value: cb' (Cb (const value)) }


instance Attr everything OnDblclick  Unit  where
  attr OnDblclick _ = unsafeAttribute $ Left $  
    { key: "dblclick", value: unset' }
instance Attr everything OnDblclick (Event.Event  Unit ) where
  attr OnDblclick eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "dblclick", value: unset' }
