module Deku.DOM.Attr.StdDeviation where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StdDeviation = StdDeviation

instance Attr FeDropShadow_ StdDeviation (NonEmpty.NonEmpty Event.Event  String ) where
  attr StdDeviation bothValues = unsafeAttribute $ Both (pure 
    { key: "stdDeviation", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stdDeviation", value: prop' value })
instance Attr FeDropShadow_ StdDeviation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StdDeviation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stdDeviation", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stdDeviation", value: prop' value })
instance Attr FeDropShadow_ StdDeviation  String  where
  attr StdDeviation value = unsafeAttribute $ This $ pure $
    { key: "stdDeviation", value: prop' value }
instance Attr FeDropShadow_ StdDeviation (Event.Event  String ) where
  attr StdDeviation eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stdDeviation", value: prop' value }

instance Attr FeDropShadow_ StdDeviation (ST.ST Global.Global  String ) where
  attr StdDeviation iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stdDeviation", value: prop' value }

instance Attr FeGaussianBlur_ StdDeviation (NonEmpty.NonEmpty Event.Event  String ) where
  attr StdDeviation bothValues = unsafeAttribute $ Both (pure 
    { key: "stdDeviation", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stdDeviation", value: prop' value })
instance Attr FeGaussianBlur_ StdDeviation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StdDeviation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stdDeviation", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stdDeviation", value: prop' value })
instance Attr FeGaussianBlur_ StdDeviation  String  where
  attr StdDeviation value = unsafeAttribute $ This $ pure $
    { key: "stdDeviation", value: prop' value }
instance Attr FeGaussianBlur_ StdDeviation (Event.Event  String ) where
  attr StdDeviation eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stdDeviation", value: prop' value }

instance Attr FeGaussianBlur_ StdDeviation (ST.ST Global.Global  String ) where
  attr StdDeviation iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stdDeviation", value: prop' value }

instance Attr everything StdDeviation (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StdDeviation bothValues = unsafeAttribute $ Both (pure 
    { key: "stdDeviation", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "stdDeviation", value: unset' })
instance Attr everything StdDeviation (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr StdDeviation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "stdDeviation", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "stdDeviation", value: unset' })
instance Attr everything StdDeviation  Unit  where
  attr StdDeviation _ = unsafeAttribute $ This $ pure $
    { key: "stdDeviation", value: unset' }
instance Attr everything StdDeviation (Event.Event  Unit ) where
  attr StdDeviation eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "stdDeviation", value: unset' }

instance Attr everything StdDeviation (ST.ST Global.Global  Unit ) where
  attr StdDeviation iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "stdDeviation", value: unset' }
