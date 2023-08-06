module Deku.DOM.Attr.MarkerUnits where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MarkerUnits = MarkerUnits

instance Attr Marker_ MarkerUnits  String  where
  attr MarkerUnits value = unsafeAttribute $ Left $  
    { key: "markerUnits", value: prop' value }
instance Attr Marker_ MarkerUnits (Event.Event  String ) where
  attr MarkerUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "markerUnits", value: prop' value }


instance Attr everything MarkerUnits  Unit  where
  attr MarkerUnits _ = unsafeAttribute $ Left $  
    { key: "markerUnits", value: unset' }
instance Attr everything MarkerUnits (Event.Event  Unit ) where
  attr MarkerUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "markerUnits", value: unset' }
