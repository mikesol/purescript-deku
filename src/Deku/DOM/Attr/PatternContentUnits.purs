module Deku.DOM.Attr.PatternContentUnits where

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

data PatternContentUnits = PatternContentUnits

instance Attr Pattern_ PatternContentUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr PatternContentUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "patternContentUnits", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "patternContentUnits", value: prop' value }
    )
instance Attr Pattern_ PatternContentUnits (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PatternContentUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "patternContentUnits", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "patternContentUnits", value: prop' value }
    )
instance Attr Pattern_ PatternContentUnits  String  where
  attr PatternContentUnits value = unsafeAttribute $ This $ pure $
    { key: "patternContentUnits", value: prop' value }
instance Attr Pattern_ PatternContentUnits (Event.Event  String ) where
  attr PatternContentUnits eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "patternContentUnits", value: prop' value }

instance Attr Pattern_ PatternContentUnits (ST.ST Global.Global  String ) where
  attr PatternContentUnits iValue = unsafeAttribute $ This $
    iValue <#> \value -> { key: "patternContentUnits", value: prop' value }

instance Attr everything PatternContentUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PatternContentUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "patternContentUnits", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "patternContentUnits", value: unset' })
instance Attr everything PatternContentUnits (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr PatternContentUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "patternContentUnits", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "patternContentUnits", value: unset' })
instance Attr everything PatternContentUnits  Unit  where
  attr PatternContentUnits _ = unsafeAttribute $ This $ pure $
    { key: "patternContentUnits", value: unset' }
instance Attr everything PatternContentUnits (Event.Event  Unit ) where
  attr PatternContentUnits eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "patternContentUnits", value: unset' }

instance Attr everything PatternContentUnits (ST.ST Global.Global  Unit ) where
  attr PatternContentUnits iValue = unsafeAttribute $ This $
    iValue <#> \_ -> { key: "patternContentUnits", value: unset' }
