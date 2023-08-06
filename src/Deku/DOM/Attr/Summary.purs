module Deku.DOM.Attr.Summary where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Summary = Summary

instance Attr Table_ Summary  String  where
  attr Summary value = unsafeAttribute $ Left $  
    { key: "summary", value: prop' value }
instance Attr Table_ Summary (Event.Event  String ) where
  attr Summary eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "summary", value: prop' value }


instance Attr everything Summary  Unit  where
  attr Summary _ = unsafeAttribute $ Left $  { key: "summary", value: unset' }
instance Attr everything Summary (Event.Event  Unit ) where
  attr Summary eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "summary", value: unset' }
