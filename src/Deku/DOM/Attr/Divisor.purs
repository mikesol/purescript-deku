module Deku.DOM.Attr.Divisor where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Divisor = Divisor

instance Attr FeConvolveMatrix_ Divisor  String  where
  attr Divisor value = unsafeAttribute $ Left $  
    { key: "divisor", value: prop' value }
instance Attr FeConvolveMatrix_ Divisor (Event.Event  String ) where
  attr Divisor eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "divisor", value: prop' value }


instance Attr everything Divisor  Unit  where
  attr Divisor _ = unsafeAttribute $ Left $  { key: "divisor", value: unset' }
instance Attr everything Divisor (Event.Event  Unit ) where
  attr Divisor eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "divisor", value: unset' }
