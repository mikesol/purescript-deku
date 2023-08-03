module Deku.DOM.Attr.PatternUnits where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternUnits = PatternUnits

instance Attr Pattern_ PatternUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr PatternUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "patternUnits", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "patternUnits", value: prop' value })
instance Attr Pattern_ PatternUnits (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PatternUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "patternUnits", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "patternUnits", value: prop' value })
instance Attr Pattern_ PatternUnits  String  where
  attr PatternUnits value = unsafeAttribute $ This $ pure $
    { key: "patternUnits", value: prop' value }
instance Attr Pattern_ PatternUnits (Event.Event  String ) where
  attr PatternUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "patternUnits", value: prop' value }

instance Attr Pattern_ PatternUnits (ST.ST Global.Global  String ) where
  attr PatternUnits stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "patternUnits", value: prop' value }

instance Attr everything PatternUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PatternUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "patternUnits", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "patternUnits", value: unset' })
instance Attr everything PatternUnits (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr PatternUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "patternUnits", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "patternUnits", value: unset' })
instance Attr everything PatternUnits  Unit  where
  attr PatternUnits _ = unsafeAttribute $ This $ pure $
    { key: "patternUnits", value: unset' }
instance Attr everything PatternUnits (Event.Event  Unit ) where
  attr PatternUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "patternUnits", value: unset' }

instance Attr everything PatternUnits (ST.ST Global.Global  Unit ) where
  attr PatternUnits stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "patternUnits", value: unset' }
