module Deku.DOM.Attr.Order where

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

data Order = Order

instance Attr FeConvolveMatrix_ Order (NonEmpty.NonEmpty Event.Event  String ) where
  attr Order bothValues = unsafeAttribute $ Both (pure 
    { key: "order", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "order", value: prop' value })
instance Attr FeConvolveMatrix_ Order (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Order (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "order", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "order", value: prop' value })
instance Attr FeConvolveMatrix_ Order  String  where
  attr Order value = unsafeAttribute $ This $ pure $
    { key: "order", value: prop' value }
instance Attr FeConvolveMatrix_ Order (Event.Event  String ) where
  attr Order eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "order", value: prop' value }

instance Attr FeConvolveMatrix_ Order (ST.ST Global.Global  String ) where
  attr Order iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "order", value: prop' value }

instance Attr everything Order (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Order bothValues = unsafeAttribute $ Both (pure  { key: "order", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "order", value: unset' })
instance Attr everything Order (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Order (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "order", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "order", value: unset' })
instance Attr everything Order  Unit  where
  attr Order _ = unsafeAttribute $ This $ { key: "order", value: unset' }
instance Attr everything Order (Event.Event  Unit ) where
  attr Order eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "order", value: unset' }

instance Attr everything Order (ST.ST Global.Global  Unit ) where
  attr Order iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "order", value: unset' }
