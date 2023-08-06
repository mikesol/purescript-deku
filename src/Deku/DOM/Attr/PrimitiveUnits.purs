module Deku.DOM.Attr.PrimitiveUnits where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PrimitiveUnits = PrimitiveUnits

instance Attr Filter_ PrimitiveUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr PrimitiveUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "primitiveUnits", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "primitiveUnits", value: prop' value })
instance Attr Filter_ PrimitiveUnits (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PrimitiveUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "primitiveUnits", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "primitiveUnits", value: prop' value })
instance Attr Filter_ PrimitiveUnits  String  where
  attr PrimitiveUnits value = unsafeAttribute $ This $ pure $
    { key: "primitiveUnits", value: prop' value }
instance Attr Filter_ PrimitiveUnits (Event.Event  String ) where
  attr PrimitiveUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "primitiveUnits", value: prop' value }

instance Attr Filter_ PrimitiveUnits (ST.ST Global.Global  String ) where
  attr PrimitiveUnits iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "primitiveUnits", value: prop' value }

instance Attr everything PrimitiveUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PrimitiveUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "primitiveUnits", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "primitiveUnits", value: unset' })
instance Attr everything PrimitiveUnits (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr PrimitiveUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "primitiveUnits", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "primitiveUnits", value: unset' })
instance Attr everything PrimitiveUnits  Unit  where
  attr PrimitiveUnits _ = unsafeAttribute $ This $ pure $
    { key: "primitiveUnits", value: unset' }
instance Attr everything PrimitiveUnits (Event.Event  Unit ) where
  attr PrimitiveUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "primitiveUnits", value: unset' }

instance Attr everything PrimitiveUnits (ST.ST Global.Global  Unit ) where
  attr PrimitiveUnits iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "primitiveUnits", value: unset' }
