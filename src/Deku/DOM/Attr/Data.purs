module Deku.DOM.Attr.Data where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Object (Object_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Data = Data

instance Attr Object_ Data  String  where
  attr Data value = unsafeAttribute $ Left $  
    { key: "data", value: prop' value }
instance Attr Object_ Data (Event.Event  String ) where
  attr Data eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "data", value: prop' value }


instance Attr everything Data  Unit  where
  attr Data _ = unsafeAttribute $ Left $  { key: "data", value: unset' }
instance Attr everything Data (Event.Event  Unit ) where
  attr Data eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "data", value: unset' }
