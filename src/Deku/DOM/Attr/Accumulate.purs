module Deku.DOM.Attr.Accumulate where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accumulate = Accumulate

instance Attr Animate_ Accumulate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accumulate bothValues = unsafeAttribute $ Both (pure 
    { key: "accumulate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accumulate", value: prop' value })
instance Attr Animate_ Accumulate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accumulate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accumulate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accumulate", value: prop' value })
instance Attr Animate_ Accumulate  String  where
  attr Accumulate value = unsafeAttribute $ This $ pure $
    { key: "accumulate", value: prop' value }
instance Attr Animate_ Accumulate (Event.Event  String ) where
  attr Accumulate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accumulate", value: prop' value }

instance Attr Animate_ Accumulate (ST.ST Global.Global  String ) where
  attr Accumulate stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accumulate", value: prop' value }

instance Attr AnimateMotion_ Accumulate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accumulate bothValues = unsafeAttribute $ Both (pure 
    { key: "accumulate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accumulate", value: prop' value })
instance Attr AnimateMotion_ Accumulate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accumulate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accumulate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accumulate", value: prop' value })
instance Attr AnimateMotion_ Accumulate  String  where
  attr Accumulate value = unsafeAttribute $ This $ pure $
    { key: "accumulate", value: prop' value }
instance Attr AnimateMotion_ Accumulate (Event.Event  String ) where
  attr Accumulate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accumulate", value: prop' value }

instance Attr AnimateMotion_ Accumulate (ST.ST Global.Global  String ) where
  attr Accumulate stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accumulate", value: prop' value }

instance Attr AnimateTransform_ Accumulate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accumulate bothValues = unsafeAttribute $ Both (pure 
    { key: "accumulate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accumulate", value: prop' value })
instance Attr AnimateTransform_ Accumulate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accumulate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "accumulate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accumulate", value: prop' value })
instance Attr AnimateTransform_ Accumulate  String  where
  attr Accumulate value = unsafeAttribute $ This $ pure $
    { key: "accumulate", value: prop' value }
instance Attr AnimateTransform_ Accumulate (Event.Event  String ) where
  attr Accumulate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accumulate", value: prop' value }

instance Attr AnimateTransform_ Accumulate (ST.ST Global.Global  String ) where
  attr Accumulate stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "accumulate", value: prop' value }

instance Attr everything Accumulate (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Accumulate bothValues = unsafeAttribute $ Both (pure 
    { key: "accumulate", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "accumulate", value: unset' })
instance Attr everything Accumulate (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Accumulate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "accumulate", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "accumulate", value: unset' })
instance Attr everything Accumulate  Unit  where
  attr Accumulate _ = unsafeAttribute $ This $ pure $
    { key: "accumulate", value: unset' }
instance Attr everything Accumulate (Event.Event  Unit ) where
  attr Accumulate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "accumulate", value: unset' }

instance Attr everything Accumulate (ST.ST Global.Global  Unit ) where
  attr Accumulate stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "accumulate", value: unset' }
