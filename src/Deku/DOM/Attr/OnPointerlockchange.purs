module Deku.DOM.Attr.OnPointerlockchange where

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

data OnPointerlockchange = OnPointerlockchange

instance Attr anything OnPointerlockchange  Cb  where
  attr OnPointerlockchange value = unsafeAttribute $ Left $  
    { key: "pointerlockchange", value: cb' value }
instance Attr anything OnPointerlockchange (Event.Event  Cb ) where
  attr OnPointerlockchange eventValue = unsafeAttribute $ Right $
    eventValue <#> \value -> { key: "pointerlockchange", value: cb' value }


instance Attr anything OnPointerlockchange  (Effect Unit)  where
  attr OnPointerlockchange value = unsafeAttribute $ Left $  
    { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerlockchange (Event.Event  (Effect Unit) ) where
  attr OnPointerlockchange eventValue = unsafeAttribute $ Right $
    eventValue <#> \value ->
      { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointerlockchange  (Effect Boolean)  where
  attr OnPointerlockchange value = unsafeAttribute $ Left $  
    { key: "pointerlockchange", value: cb' (Cb (const value)) }
instance Attr anything OnPointerlockchange (Event.Event  (Effect Boolean) ) where
  attr OnPointerlockchange eventValue = unsafeAttribute $ Right $
    eventValue <#> \value ->
      { key: "pointerlockchange", value: cb' (Cb (const value)) }


instance Attr everything OnPointerlockchange  Unit  where
  attr OnPointerlockchange _ = unsafeAttribute $ Left $  
    { key: "pointerlockchange", value: unset' }
instance Attr everything OnPointerlockchange (Event.Event  Unit ) where
  attr OnPointerlockchange eventValue = unsafeAttribute $ Right $
    eventValue <#> \_ -> { key: "pointerlockchange", value: unset' }
