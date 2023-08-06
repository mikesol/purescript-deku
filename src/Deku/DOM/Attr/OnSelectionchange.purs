module Deku.DOM.Attr.OnSelectionchange where

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

data OnSelectionchange = OnSelectionchange

instance Attr anything OnSelectionchange  Cb  where
  attr OnSelectionchange value = unsafeAttribute $ Left $  
    { key: "selectionchange", value: cb' value }
instance Attr anything OnSelectionchange (Event.Event  Cb ) where
  attr OnSelectionchange eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "selectionchange", value: cb' value }


instance Attr anything OnSelectionchange  (Effect Unit)  where
  attr OnSelectionchange value = unsafeAttribute $ Left $  
    { key: "selectionchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelectionchange (Event.Event  (Effect Unit) ) where
  attr OnSelectionchange eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value ->
      { key: "selectionchange", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnSelectionchange  (Effect Boolean)  where
  attr OnSelectionchange value = unsafeAttribute $ Left $  
    { key: "selectionchange", value: cb' (Cb (const value)) }
instance Attr anything OnSelectionchange (Event.Event  (Effect Boolean) ) where
  attr OnSelectionchange eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "selectionchange", value: cb' (Cb (const value)) }


instance Attr everything OnSelectionchange  Unit  where
  attr OnSelectionchange _ = unsafeAttribute $ Left $  
    { key: "selectionchange", value: unset' }
instance Attr everything OnSelectionchange (Event.Event  Unit ) where
  attr OnSelectionchange eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "selectionchange", value: unset' }
