module Deku.DOM.Attr.List where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data List = List

instance Attr Input_ List  String  where
  attr List value = unsafeAttribute $ Left $  
    { key: "list", value: prop' value }
instance Attr Input_ List (Event.Event  String ) where
  attr List eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "list", value: prop' value }


instance Attr everything List  Unit  where
  attr List _ = unsafeAttribute $ Left $  { key: "list", value: unset' }
instance Attr everything List (Event.Event  Unit ) where
  attr List eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "list", value: unset' }
