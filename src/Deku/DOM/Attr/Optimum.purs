module Deku.DOM.Attr.Optimum where

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

data Optimum = Optimum

instance Attr Meter_ Optimum (NonEmpty.NonEmpty Event.Event  String ) where
  attr Optimum bothValues = unsafeAttribute $ Both (pure 
    { key: "optimum", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "optimum", value: prop' value })
instance Attr Meter_ Optimum (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Optimum (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "optimum", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "optimum", value: prop' value })
instance Attr Meter_ Optimum  String  where
  attr Optimum value = unsafeAttribute $ This $ pure $
    { key: "optimum", value: prop' value }
instance Attr Meter_ Optimum (Event.Event  String ) where
  attr Optimum eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "optimum", value: prop' value }

instance Attr Meter_ Optimum (ST.ST Global.Global  String ) where
  attr Optimum stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "optimum", value: prop' value }

instance Attr everything Optimum (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Optimum bothValues = unsafeAttribute $ Both (pure 
    { key: "optimum", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "optimum", value: unset' })
instance Attr everything Optimum (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Optimum (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "optimum", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "optimum", value: unset' })
instance Attr everything Optimum  Unit  where
  attr Optimum _ = unsafeAttribute $ This $ pure $ { key: "optimum", value: unset' }
instance Attr everything Optimum (Event.Event  Unit ) where
  attr Optimum eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "optimum", value: unset' }

instance Attr everything Optimum (ST.ST Global.Global  Unit ) where
  attr Optimum stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "optimum", value: unset' }
