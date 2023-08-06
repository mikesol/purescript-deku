module Deku.DOM.Attr.OnFormdata where

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

data OnFormdata = OnFormdata

instance Attr anything OnFormdata  Cb  where
  attr OnFormdata value = unsafeAttribute $ Left $  
    { key: "formdata", value: cb' value }
instance Attr anything OnFormdata (Event.Event  Cb ) where
  attr OnFormdata eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "formdata", value: cb' value }


instance Attr anything OnFormdata  (Effect Unit)  where
  attr OnFormdata value = unsafeAttribute $ Left $  
    { key: "formdata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnFormdata (Event.Event  (Effect Unit) ) where
  attr OnFormdata eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "formdata", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnFormdata  (Effect Boolean)  where
  attr OnFormdata value = unsafeAttribute $ Left $  
    { key: "formdata", value: cb' (Cb (const value)) }
instance Attr anything OnFormdata (Event.Event  (Effect Boolean) ) where
  attr OnFormdata eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "formdata", value: cb' (Cb (const value)) }


instance Attr everything OnFormdata  Unit  where
  attr OnFormdata _ = unsafeAttribute $ Left $  
    { key: "formdata", value: unset' }
instance Attr everything OnFormdata (Event.Event  Unit ) where
  attr OnFormdata eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "formdata", value: unset' }
