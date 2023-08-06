module Deku.DOM.Attr.Pattern where

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

data Pattern = Pattern

instance Attr Input_ Pattern  String  where
  attr Pattern value = unsafeAttribute $ Left $  
    { key: "pattern", value: prop' value }
instance Attr Input_ Pattern (Event.Event  String ) where
  attr Pattern eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pattern", value: prop' value }


instance Attr everything Pattern  Unit  where
  attr Pattern _ = unsafeAttribute $ Left $  { key: "pattern", value: unset' }
instance Attr everything Pattern (Event.Event  Unit ) where
  attr Pattern eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "pattern", value: unset' }
