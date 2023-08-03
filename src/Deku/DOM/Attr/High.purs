module Deku.DOM.Attr.High where

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

data High = High

instance Attr Meter_ High (NonEmpty.NonEmpty Event.Event  String ) where
  attr High bothValues = unsafeAttribute $ Both (pure 
    { key: "high", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "high", value: prop' value })
instance Attr Meter_ High (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr High (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "high", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "high", value: prop' value })
instance Attr Meter_ High  String  where
  attr High value = unsafeAttribute $ This $ pure $
    { key: "high", value: prop' value }
instance Attr Meter_ High (Event.Event  String ) where
  attr High eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "high", value: prop' value }

instance Attr Meter_ High (ST.ST Global.Global  String ) where
  attr High stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "high", value: prop' value }

instance Attr everything High (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr High bothValues = unsafeAttribute $ Both (pure  { key: "high", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "high", value: unset' })
instance Attr everything High (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr High (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "high", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "high", value: unset' })
instance Attr everything High  Unit  where
  attr High _ = unsafeAttribute $ This $ pure $ { key: "high", value: unset' }
instance Attr everything High (Event.Event  Unit ) where
  attr High eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "high", value: unset' }

instance Attr everything High (ST.ST Global.Global  Unit ) where
  attr High stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "high", value: unset' }
