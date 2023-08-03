module Deku.DOM.Attr.MarkerWidth where

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

data MarkerWidth = MarkerWidth

instance Attr Marker_ MarkerWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "markerWidth", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "markerWidth", value: prop' value })
instance Attr Marker_ MarkerWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr MarkerWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "markerWidth", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "markerWidth", value: prop' value })
instance Attr Marker_ MarkerWidth  String  where
  attr MarkerWidth value = unsafeAttribute $ This $ pure $
    { key: "markerWidth", value: prop' value }
instance Attr Marker_ MarkerWidth (Event.Event  String ) where
  attr MarkerWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "markerWidth", value: prop' value }

instance Attr Marker_ MarkerWidth (ST.ST Global.Global  String ) where
  attr MarkerWidth stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "markerWidth", value: prop' value }

instance Attr everything MarkerWidth (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr MarkerWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "markerWidth", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "markerWidth", value: unset' })
instance Attr everything MarkerWidth (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr MarkerWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "markerWidth", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "markerWidth", value: unset' })
instance Attr everything MarkerWidth  Unit  where
  attr MarkerWidth _ = unsafeAttribute $ This $ pure $
    { key: "markerWidth", value: unset' }
instance Attr everything MarkerWidth (Event.Event  Unit ) where
  attr MarkerWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "markerWidth", value: unset' }

instance Attr everything MarkerWidth (ST.ST Global.Global  Unit ) where
  attr MarkerWidth stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "markerWidth", value: unset' }
