module Deku.DOM.Attr.Optimum where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Optimum = Optimum

instance Attr Meter_ Optimum  String  where
  attr Optimum value = unsafeAttribute $ Left $  
    { key: "optimum", value: prop' value }
instance Attr Meter_ Optimum (Event.Event  String ) where
  attr Optimum eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "optimum", value: prop' value }


instance Attr everything Optimum  Unit  where
  attr Optimum _ = unsafeAttribute $ Left $  { key: "optimum", value: unset' }
instance Attr everything Optimum (Event.Event  Unit ) where
  attr Optimum eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "optimum", value: unset' }
