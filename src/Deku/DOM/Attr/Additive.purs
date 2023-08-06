module Deku.DOM.Attr.Additive where

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

data Additive = Additive

instance Attr Animate_ Additive (NonEmpty.NonEmpty Event.Event  String ) where
  attr Additive bothValues = unsafeAttribute $ Both (pure 
    { key: "additive", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "additive", value: prop' value })
instance Attr Animate_ Additive (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Additive (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "additive", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "additive", value: prop' value })
instance Attr Animate_ Additive  String  where
  attr Additive value = unsafeAttribute $ This $ pure $
    { key: "additive", value: prop' value }
instance Attr Animate_ Additive (Event.Event  String ) where
  attr Additive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "additive", value: prop' value }

instance Attr Animate_ Additive (ST.ST Global.Global  String ) where
  attr Additive iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "additive", value: prop' value }

instance Attr AnimateMotion_ Additive (NonEmpty.NonEmpty Event.Event  String ) where
  attr Additive bothValues = unsafeAttribute $ Both (pure 
    { key: "additive", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "additive", value: prop' value })
instance Attr AnimateMotion_ Additive (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Additive (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "additive", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "additive", value: prop' value })
instance Attr AnimateMotion_ Additive  String  where
  attr Additive value = unsafeAttribute $ This $ pure $
    { key: "additive", value: prop' value }
instance Attr AnimateMotion_ Additive (Event.Event  String ) where
  attr Additive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "additive", value: prop' value }

instance Attr AnimateMotion_ Additive (ST.ST Global.Global  String ) where
  attr Additive iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "additive", value: prop' value }

instance Attr AnimateTransform_ Additive (NonEmpty.NonEmpty Event.Event  String ) where
  attr Additive bothValues = unsafeAttribute $ Both (pure 
    { key: "additive", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "additive", value: prop' value })
instance Attr AnimateTransform_ Additive (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Additive (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "additive", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "additive", value: prop' value })
instance Attr AnimateTransform_ Additive  String  where
  attr Additive value = unsafeAttribute $ This $ pure $
    { key: "additive", value: prop' value }
instance Attr AnimateTransform_ Additive (Event.Event  String ) where
  attr Additive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "additive", value: prop' value }

instance Attr AnimateTransform_ Additive (ST.ST Global.Global  String ) where
  attr Additive iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "additive", value: prop' value }

instance Attr everything Additive (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Additive bothValues = unsafeAttribute $ Both (pure 
    { key: "additive", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "additive", value: unset' })
instance Attr everything Additive (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Additive (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "additive", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "additive", value: unset' })
instance Attr everything Additive  Unit  where
  attr Additive _ = unsafeAttribute $ This $ pure $
    { key: "additive", value: unset' }
instance Attr everything Additive (Event.Event  Unit ) where
  attr Additive eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "additive", value: unset' }

instance Attr everything Additive (ST.ST Global.Global  Unit ) where
  attr Additive iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "additive", value: unset' }
