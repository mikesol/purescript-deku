module Deku.DOM.Attr.MarkerHeight where

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

data MarkerHeight = MarkerHeight

instance Attr Marker_ MarkerHeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerHeight bothValues = unsafeAttribute $ Both (pure 
    { key: "markerHeight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "markerHeight", value: prop' value })
instance Attr Marker_ MarkerHeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr MarkerHeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "markerHeight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "markerHeight", value: prop' value })
instance Attr Marker_ MarkerHeight  String  where
  attr MarkerHeight value = unsafeAttribute $ This $ pure $
    { key: "markerHeight", value: prop' value }
instance Attr Marker_ MarkerHeight (Event.Event  String ) where
  attr MarkerHeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "markerHeight", value: prop' value }

instance Attr Marker_ MarkerHeight (ST.ST Global.Global  String ) where
  attr MarkerHeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "markerHeight", value: prop' value }

instance Attr everything MarkerHeight (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr MarkerHeight bothValues = unsafeAttribute $ Both (pure 
    { key: "markerHeight", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "markerHeight", value: unset' })
instance Attr everything MarkerHeight (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr MarkerHeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "markerHeight", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "markerHeight", value: unset' })
instance Attr everything MarkerHeight  Unit  where
  attr MarkerHeight _ = unsafeAttribute $ This $ pure $
    { key: "markerHeight", value: unset' }
instance Attr everything MarkerHeight (Event.Event  Unit ) where
  attr MarkerHeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "markerHeight", value: unset' }

instance Attr everything MarkerHeight (ST.ST Global.Global  Unit ) where
  attr MarkerHeight iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "markerHeight", value: unset' }
