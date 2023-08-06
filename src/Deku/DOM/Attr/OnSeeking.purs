module Deku.DOM.Attr.OnSeeking where

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

data OnSeeking = OnSeeking

instance Attr anything OnSeeking  Cb  where
  attr OnSeeking value = unsafeAttribute $ Left $  
    { key: "seeking", value: cb' value }
instance Attr anything OnSeeking (Event.Event  Cb ) where
  attr OnSeeking eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "seeking", value: cb' value }


instance Attr anything OnSeeking  (Effect Unit)  where
  attr OnSeeking value = unsafeAttribute $ Left $  
    { key: "seeking", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSeeking (Event.Event  (Effect Unit) ) where
  attr OnSeeking eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "seeking", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnSeeking  (Effect Boolean)  where
  attr OnSeeking value = unsafeAttribute $ Left $  
    { key: "seeking", value: cb' (Cb (const value)) }
instance Attr anything OnSeeking (Event.Event  (Effect Boolean) ) where
  attr OnSeeking eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "seeking", value: cb' (Cb (const value)) }


instance Attr everything OnSeeking  Unit  where
  attr OnSeeking _ = unsafeAttribute $ Left $  
    { key: "seeking", value: unset' }
instance Attr everything OnSeeking (Event.Event  Unit ) where
  attr OnSeeking eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "seeking", value: unset' }
