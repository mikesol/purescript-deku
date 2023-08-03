module Deku.DOM.Attr.MarkerUnits where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MarkerUnits = MarkerUnits

instance Attr Marker_ MarkerUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "markerUnits", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "markerUnits", value: prop' value })
instance Attr Marker_ MarkerUnits (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr MarkerUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "markerUnits", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "markerUnits", value: prop' value })
instance Attr Marker_ MarkerUnits  String  where
  attr MarkerUnits value = unsafeAttribute $ This $ pure $
    { key: "markerUnits", value: prop' value }
instance Attr Marker_ MarkerUnits (Event.Event  String ) where
  attr MarkerUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "markerUnits", value: prop' value }

instance Attr Marker_ MarkerUnits (ST.ST Global.Global  String ) where
  attr MarkerUnits stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "markerUnits", value: prop' value }

instance Attr everything MarkerUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr MarkerUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "markerUnits", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "markerUnits", value: unset' })
instance Attr everything MarkerUnits (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr MarkerUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "markerUnits", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "markerUnits", value: unset' })
instance Attr everything MarkerUnits  Unit  where
  attr MarkerUnits _ = unsafeAttribute $ This $ pure $
    { key: "markerUnits", value: unset' }
instance Attr everything MarkerUnits (Event.Event  Unit ) where
  attr MarkerUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "markerUnits", value: unset' }

instance Attr everything MarkerUnits (ST.ST Global.Global  Unit ) where
  attr MarkerUnits stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "markerUnits", value: unset' }
