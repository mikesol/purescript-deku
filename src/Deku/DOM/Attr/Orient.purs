module Deku.DOM.Attr.Orient where

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

data Orient = Orient

instance Attr Marker_ Orient (NonEmpty.NonEmpty Event.Event  String ) where
  attr Orient bothValues = unsafeAttribute $ Both (pure 
    { key: "orient", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "orient", value: prop' value })
instance Attr Marker_ Orient (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Orient (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "orient", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "orient", value: prop' value })
instance Attr Marker_ Orient  String  where
  attr Orient value = unsafeAttribute $ This $ pure $
    { key: "orient", value: prop' value }
instance Attr Marker_ Orient (Event.Event  String ) where
  attr Orient eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "orient", value: prop' value }

instance Attr Marker_ Orient (ST.ST Global.Global  String ) where
  attr Orient iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "orient", value: prop' value }

instance Attr everything Orient (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Orient bothValues = unsafeAttribute $ Both (pure 
    { key: "orient", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "orient", value: unset' })
instance Attr everything Orient (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Orient (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "orient", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "orient", value: unset' })
instance Attr everything Orient  Unit  where
  attr Orient _ = unsafeAttribute $ This $ { key: "orient", value: unset' }
instance Attr everything Orient (Event.Event  Unit ) where
  attr Orient eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "orient", value: unset' }

instance Attr everything Orient (ST.ST Global.Global  Unit ) where
  attr Orient iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "orient", value: unset' }
