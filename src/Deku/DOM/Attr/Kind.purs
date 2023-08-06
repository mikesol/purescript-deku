module Deku.DOM.Attr.Kind where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Kind = Kind

instance Attr Track_ Kind  String  where
  attr Kind value = unsafeAttribute $ Left $  
    { key: "kind", value: prop' value }
instance Attr Track_ Kind (Event.Event  String ) where
  attr Kind eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "kind", value: prop' value }


instance Attr everything Kind  Unit  where
  attr Kind _ = unsafeAttribute $ Left $  { key: "kind", value: unset' }
instance Attr everything Kind (Event.Event  Unit ) where
  attr Kind eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "kind", value: unset' }
