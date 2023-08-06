module Deku.DOM.Attr.Points where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Points = Points

instance Attr Polygon_ Points (NonEmpty.NonEmpty Event.Event  String ) where
  attr Points bothValues = unsafeAttribute $ Both (pure 
    { key: "points", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "points", value: prop' value })
instance Attr Polygon_ Points (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Points (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "points", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "points", value: prop' value })
instance Attr Polygon_ Points  String  where
  attr Points value = unsafeAttribute $ This $ pure $
    { key: "points", value: prop' value }
instance Attr Polygon_ Points (Event.Event  String ) where
  attr Points eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "points", value: prop' value }

instance Attr Polygon_ Points (ST.ST Global.Global  String ) where
  attr Points iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "points", value: prop' value }

instance Attr Polyline_ Points (NonEmpty.NonEmpty Event.Event  String ) where
  attr Points bothValues = unsafeAttribute $ Both (pure 
    { key: "points", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "points", value: prop' value })
instance Attr Polyline_ Points (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Points (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "points", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "points", value: prop' value })
instance Attr Polyline_ Points  String  where
  attr Points value = unsafeAttribute $ This $ pure $
    { key: "points", value: prop' value }
instance Attr Polyline_ Points (Event.Event  String ) where
  attr Points eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "points", value: prop' value }

instance Attr Polyline_ Points (ST.ST Global.Global  String ) where
  attr Points iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "points", value: prop' value }

instance Attr everything Points (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Points bothValues = unsafeAttribute $ Both (pure 
    { key: "points", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "points", value: unset' })
instance Attr everything Points (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Points (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "points", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "points", value: unset' })
instance Attr everything Points  Unit  where
  attr Points _ = unsafeAttribute $ This $ { key: "points", value: unset' }
instance Attr everything Points (Event.Event  Unit ) where
  attr Points eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "points", value: unset' }

instance Attr everything Points (ST.ST Global.Global  Unit ) where
  attr Points iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "points", value: unset' }
