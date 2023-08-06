module Deku.DOM.Attr.Low where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Low = Low

instance Attr Meter_ Low (NonEmpty.NonEmpty Event.Event  String ) where
  attr Low bothValues = unsafeAttribute $ Both (pure 
    { key: "low", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "low", value: prop' value })
instance Attr Meter_ Low (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Low (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "low", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "low", value: prop' value })
instance Attr Meter_ Low  String  where
  attr Low value = unsafeAttribute $ This $ { key: "low", value: prop' value }
instance Attr Meter_ Low (Event.Event  String ) where
  attr Low eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "low", value: prop' value }

instance Attr Meter_ Low (ST.ST Global.Global  String ) where
  attr Low iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "low", value: prop' value }

instance Attr everything Low (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Low bothValues = unsafeAttribute $ Both (pure  { key: "low", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "low", value: unset' })
instance Attr everything Low (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Low (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "low", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "low", value: unset' })
instance Attr everything Low  Unit  where
  attr Low _ = unsafeAttribute $ This $ { key: "low", value: unset' }
instance Attr everything Low (Event.Event  Unit ) where
  attr Low eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "low", value: unset' }

instance Attr everything Low (ST.ST Global.Global  Unit ) where
  attr Low iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "low", value: unset' }
