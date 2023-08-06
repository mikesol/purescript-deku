module Deku.DOM.Attr.OnLoadedmetadata where

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

data OnLoadedmetadata = OnLoadedmetadata

instance Attr anything OnLoadedmetadata  Cb  where
  attr OnLoadedmetadata value = unsafeAttribute $ Left $  
    { key: "loadedmetadata", value: cb' value }
instance Attr anything OnLoadedmetadata (Event.Event  Cb ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "loadedmetadata", value: cb' value }


instance Attr anything OnLoadedmetadata  (Effect Unit)  where
  attr OnLoadedmetadata value = unsafeAttribute $ Left $  
    { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadedmetadata (Event.Event  (Effect Unit) ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value ->
      { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnLoadedmetadata  (Effect Boolean)  where
  attr OnLoadedmetadata value = unsafeAttribute $ Left $  
    { key: "loadedmetadata", value: cb' (Cb (const value)) }
instance Attr anything OnLoadedmetadata (Event.Event  (Effect Boolean) ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "loadedmetadata", value: cb' (Cb (const value)) }


instance Attr everything OnLoadedmetadata  Unit  where
  attr OnLoadedmetadata _ = unsafeAttribute $ Left $  
    { key: "loadedmetadata", value: unset' }
instance Attr everything OnLoadedmetadata (Event.Event  Unit ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "loadedmetadata", value: unset' }
