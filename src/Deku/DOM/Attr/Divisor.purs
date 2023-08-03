module Deku.DOM.Attr.Divisor where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Divisor = Divisor

instance Attr FeConvolveMatrix_ Divisor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Divisor bothValues = unsafeAttribute $ Both (pure 
    { key: "divisor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "divisor", value: prop' value })
instance Attr FeConvolveMatrix_ Divisor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Divisor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "divisor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "divisor", value: prop' value })
instance Attr FeConvolveMatrix_ Divisor  String  where
  attr Divisor value = unsafeAttribute $ This $ pure $
    { key: "divisor", value: prop' value }
instance Attr FeConvolveMatrix_ Divisor (Event.Event  String ) where
  attr Divisor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "divisor", value: prop' value }

instance Attr FeConvolveMatrix_ Divisor (ST.ST Global.Global  String ) where
  attr Divisor stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "divisor", value: prop' value }

instance Attr everything Divisor (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Divisor bothValues = unsafeAttribute $ Both (pure 
    { key: "divisor", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "divisor", value: unset' })
instance Attr everything Divisor (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Divisor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "divisor", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "divisor", value: unset' })
instance Attr everything Divisor  Unit  where
  attr Divisor _ = unsafeAttribute $ This $ pure $ { key: "divisor", value: unset' }
instance Attr everything Divisor (Event.Event  Unit ) where
  attr Divisor eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "divisor", value: unset' }

instance Attr everything Divisor (ST.ST Global.Global  Unit ) where
  attr Divisor stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "divisor", value: unset' }
